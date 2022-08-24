# frozen_string_literal: true

##### DESCRIPTION #####
# Given one array arr and a sum s, find the LONGEST subarray which
# the sum adds up to the value of s. Return the beginning and ending
# indexes if found
##### INPUT #####
arr = [1, 2, 3, 4, 5, 0, 0, 0, 6, 7, 8, 9, 10]
s = 15
##### OUTPUT #####
[1, 8]

# Time complexity: T(n) = (n)*(n-1) = O(n^2-n)
# Space complexity: S(n) = O(1)
def first_solution(arr, s)
  longest_solution_size = 0
  i1, i2 = 0

  arr.each_with_index do |i, index|
    sum = i
    current_solution_size = 0
    (index + 1..arr.size - 1).each do |j|
      sum += arr[j]
      current_solution_size += 1

      next unless sum == s &&
        j + 1 < arr.size && arr[j + 1] + sum > s &&
        current_solution_size > longest_solution_size

      longest_solution_size = current_solution_size
      i1 = index + 1
      i2 = j + 1
      break
    end
  end

  [i1, i2]
end

# Time complexity: T(n) = O(n)
# Space complexity: S(n) = O(1)
def second_solution(arr, s)
  left = 0
  right = 0 
  sum = left
  result = [-1,-1]

  while (right < arr.size) do
    sum += arr[right]
    while (left < right && sum > s)
      left += 1
      sum -= arr[left]
    end
    if (sum == s && (result[1] - result[0] < right - left))
      result = [left+1,right+1]
    end
    right+=1
  end

  result
end

puts "First solution: #{first_solution(arr, s)}"
puts "Second solution: #{second_solution(arr, s)}"
