##### DESCRIPTION #####
# Given an array of integers arr and an integer k, find the kth largest element
##### INPUT #####
# arr = [4,2,9,7,5,6,7,1,3]
# k = 4
##### OUTPUT #####
# 6

# Time complexity: T(n) = O(nlogn)
# sort is O(nlogn)
# Space complexity: S(n) = Depends on the sorting algorithm
def first_solution(arr, k)
  arr.sort[arr.size - k]
end

# Time complexity: T(n,k) = ((k-1) * 2n) + n = 2kn - n = O(kn)
# arr.max = n
# arr.index = n
# (k-1).times = k-1
# Space complexity: S(n,k) = O(1)
def second_solution(arr, k)
  (k - 1).times do |_kth_element|
    arr.delete_at(arr.index(arr.max))
  end
  arr.max
end

# Time complexity: T(n,k) = 2n + (k - 1) * logn = O(n + klogn)
# When k is close to n => T(n) = O(nlogn) => BAD
# When k is close to 0 => T(n) = O(n) => GOOD
# Space complexity: S(n,k) = n
def third_solution(arr, _k)
  heap = Heap.new(arr) # n
  heap.create_heap # n
  (k - 1).times do |_kth_element| # k - 1
    heap.remove_max # logn
  end
  heap.max # 1
end

# A heap is an array with the special condition that, when visualized as a tree, the max heap property holds:
# the children of each node have key values smaller than that of the node itself
class Heap
  attr_accessor :heap_size, :array_rep

  def initialize(arr)
    @array_rep = arr
    @heap_size = arr.size
  end

  def left_child(index)
    2 * index + 1
  end

  def right_child(index)
    2 * index + 2
  end

  def left_child_key(index)
    @array_rep[left_child(index)]
  end

  def right_child_key(index)
    @array_rep[right_child(index)]
  end

  def leaf_node?(index)
    index >= @heap_size / 2
  end

  def satisfied?(index)
    @array_rep[index] >= left_child_key(index) && @array_rep[index] >= right_child_key(index)
  end

  # Each swap resulting from a call of fix_one_error takes O(1) time and when we have n elements,
  # our tree has (log2)(n) levels in it so we end up with O((log2)(n)) as our time complexity
  def fix_one_error(index)
    return if leaf_node?(index) || satisfied?(index)

    left_child_key = @array_rep[left_child(index)]
    right_child_key = @array_rep[right_child(index)]

    larger_child = if left_child_key > right_child_key
                     left_child(index)
                   else
                     right_child(index)
                   end

    @array_rep[index] = @array_rep[larger_child]
    @array_rep[larger_child] = @array_rep[index]

    fix_one_error(larger_child)
  end

  # Our complexity for fix_one_error is related to what level in the whole tree it starts out:
  # the higher it is, the more time it will take. In fact, this relationship is linear.
  # In other words, fix_one_error can be characterized as O(h) where h is the height from the leaf
  # nodes at which fix_one_error is called. But, as we move higher in the tree, there are fewer and fewer nodes.
  # If you take the time to sum up the series that results when analyzing the complexity,
  # you can show that our algorithm can run in O(n) time.
  def create_max_heap
    (0..@heap_size / 2 - 1).to_a.reverse.each do |index|
      fix_one_error(index)
    end
  end

  def create_heap
    @heap_size.times do |index|
      fix_one_error(index)
    end
  end

  def max
    array_rep[0]
  end

  def remove_max
    array_rep[@heap_size - 1], array_rep[0] = array_rep[0], array_rep[@heap_size - 1]
    @heap_size -= 1
    fix_one_error(0)
  end
end

arr = [4, 2, 9, 7, 5, 6, 7, 1, 3]
k = 4

puts "First solution: #{first_solution(arr, k)}"
puts "Second solution: #{second_solution(arr, k)}"
puts "Third solution: #{third_solution(arr, k)}" # not working
