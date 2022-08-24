##################
# FIRST SOLUTION #
##################

# set complexity -> O(n) -> because array.shift takes O(n) to reorder the array
# get complexity -> O(n) -> because of the shift again
# space complexity -> O(2n) -> O(n)
class LRUCacheSimple
  def initialize(size_limit)
    @size_limit = size_limit
    @cache = {}
    @cache_stack = []
  end

  def erase_first_if_over_limit
    return unless @cache.size == @size_limit

    @cache.delete(@cache_stack.first)
    @cache_stack.shift
  end

  def set(key, value)
    erase_first_if_over_limit
    @cache[key] = value
    @cache_stack << key
  end

  def get(key)
    if @cache_stack.last != key && !@cache[key].nil?
      @cache_stack.shift
      @cache_stack << key
    end
    puts @cache[key].nil? ? 'Vazio' : @cache[key]
  end
end

def print_results
  cache = LRUCacheSimple.new(2)
  cache.set('user1', 'Alex')
  cache.set('user2', 'Guil')
  cache.set('user3', 'Rose')
  cache.get('user1') # Vazio
  cache.get('user2') # moves user2 to top of the stack (before user3)
  cache.set('user4', 'Dani')
  cache.get('user3') # Vazio
  cache.get('user2') # Guil
  cache.get('user4') # Dani
end
# print_results

###################
# SECOND SOLUTION #
###################

class Node
  def initialize(key:, value:, previous_node:, next_node: nil)
    @key = key
    @value = value
    @previous_node = previous_node
    @next_node = next_node
  end

  attr_reader :key
  attr_accessor :value, :previous_node, :next_node
end

# set complexity -> O(1)
# get complexity -> O(1)
# space complexity -> O(n)
class LRUCacheComplex
  def initialize(size_limit)
    @size_limit = size_limit
    @nodes = {}
    @size = 0
    @first_node = nil
    @last_node = nil
  end

  def set(key, value)
    # first node
    if @size.zero?
      node = Node.new(key:, value:, previous_node: @last_node)
      @nodes[key] = node
      @first_node = node
      @last_node = node
      @size += 1
    else
      node = @nodes[key]

      # node already exists
      if !node.nil?
        node.value = value
        # returns if there is only one node
        return if @size == 1
        # returns if node is already the last one
        return if @last_node.key == key

        # node exists and it is the first node
        if @first_node.key == key
          @first_node = @first_node.next_node
          @first_node.previous_node = nil
        else
          previous_node = node.previous_node
          next_node = node.next_node
          previous_node.next_node = next_node
          next_node.previous_node = previous_node
        end

        node.next_node = nil
      # node does not exist and needs to be created
      else
        node = Node.new(key:, value:, previous_node: @last_node)
        # remove LRU if size limit is reached
        if @size == @size_limit
          remove_first_node
        else
          @size += 1
        end
        @nodes[key] = node
      end

      @last_node.next_node = node
      node.previous_node = @last_node
      @last_node = node
    end
  end

  def get(key)
    puts @nodes[key]&.value || 'Vazio'
  end

  def remove_first_node
    @nodes[@first_node.key] = nil
    second_node = @first_node.next_node
    second_node.previous_node = nil
    @first_node = second_node
  end

  def print_node(node)
    puts "KEY=#{node.key} VALUE=#{node.value} PREVIOUS_NODE=#{node.previous_node&.key} NEXT_NODE=#{node.next_node&.key}"
    print_node(node.next_node) unless node.next_node.nil?
  end

  def print
    puts '#' * 60
    puts "SIZE = #{@size}"
    puts "FIRST NODE = #{@first_node.key}"
    puts "LAST NODE = #{@last_node.key}"
    print_node(@first_node)
    puts '#' * 60
  end
end

def print_results
  cache = LRUCacheComplex.new(3)
  cache.set('user1', 'Alex')
  cache.set('user2', 'Guil')
  cache.set('user3', 'Tom')
  cache.set('user1', 'Rose') # change first value
  cache.set('user2', 'Dani') # change second value
  cache.set('user3', 'Paul') # change third value
  cache.set('user4', 'Tim') # adds a new value and remove LRU
  cache.get('user1') # Vazio
  cache.get('user2') # Dani
  cache.set('user5', 'Yuri')
  cache.get('user2') # Vazio
  cache.get('user3') # Paul
  cache.get('user4') # Tim
  cache.get('user5') # Yuri
end
print_results
