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
  (k-1).times do |kth_element|
    arr.delete_at(arr.index(arr.max))
  end
  arr.max
end

# Time complexity: T(n) =
# Space complexity: S(n) = 
def third_solution(arr, k)
end

class Heap
  attr_accessor :heap_size, :array_rep

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
end

arr = [4,2,9,7,5,6,7,1,3]
k = 4

puts "First solution: #{first_solution(arr, k)}"
puts "Second solution: #{second_solution(arr, k)}"
puts "Third solution: #{third_solution(arr, k)}"
