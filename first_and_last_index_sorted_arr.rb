# Given a sorted array of integers arr and an integer target, 
# find the index of the first and last position of target in ar.
# If target can't be found in arr, return [-1,-1]
# Output: [-1,-1] or [pos1, pos2]

# Time complexity: T(n) = O(n)
# Space complexity: S(n) = O(1)
def first_solution(arr,target)
  min = max = -1
  arr.each_with_index do |number, index|
    break if number > target

    if number == target 
      if min == -1
        min = index
      else
        max = index
      end
    end
  end

  [min,max]
end

# Time complexity: T(n) = O(n)
# Space complexity: S(n) = O(1)
def second_solution(arr,target)
  arr.each_with_index do |number, index|
    break if number > target

    if number == target 
      min = index
      while(index + 1 < arr.size && arr[index + 1] == target) do
        index += 1
      end
      return [min, index]
    end
  end
  [-1,-1]
end

# Time complexity: T(n) = 2 * O(logn) = O(logn) # two binary searches
# Space complexity: S(n) = O(1)
def third_solution(arr, target)
  return [-1,-1] if arr.size == 0  || arr[0] > target || arr[-1] < target

  start = find_start(arr, target)
  ending = find_end(arr, target)

  return [start, ending]
end

def find_start(arr, target)
  return 0 if arr[0] == target

  left = 0
  right = arr.size - 1

  while(left <= right)
    mid = (left + right) / 2
    if(arr[mid] == target && arr[mid - 1] < target)
      return mid
    elsif(arr[mid] < target)
      left = mid + 1
    else
      right = mid - 1
    end
  end

  return - 1
end

def find_end(arr, target)
  return arr.size - 1 if arr[-1] == target

  left = 0
  right = arr.size - 1

  while(left <= right)
    mid = (left + right) / 2
    if(arr[mid] == target && arr[mid + 1] > target)
      return mid
    elsif(arr[mid] > target)
      right = mid - 1
    else
      left = mid + 1
    end
  end

  return - 1
end

arr = [2,4,5,5,5,5,5,7,9,9]
target = 5

puts "First solution: #{first_solution(arr,target)}"
puts "Second solution: #{second_solution(arr,target)}"
puts "Third solution: #{third_solution(arr,target)}"
