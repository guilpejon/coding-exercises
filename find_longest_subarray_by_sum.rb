# frozen_string_literal: true

##### DESCRIPTION #####
# Given one array arr and a sum s, find the LONGEST subarray which
# the sum adds up to the value of s. Return the beginning and ending
# indexes if found
##### INPUT #####
arr = [1, 2, 3, 4, 5, 0, 0, 0, 6, 7, 8, 9, 10]
s = 15
##### OUTPUT #####
[2, 4]

# Time complexity: T(n) =
# Space complexity: S(n) =
def first_solution(arr, s)
  longest_solution_size = 0
  i1, i2 = 0

  arr.each_with_index do |i, index|
    # return if index - 1 == arr.size
    sum = i
    current_solution_size = 0
    (index..arr.size - 1).each do |j|
      sum += arr[j]
      current_solution_size += 1

      next unless sum == s && j + 1 < arr.size && arr[j + 1] + sum > s && current_solution_size > longest_solution_size

      puts "SUM=#{sum} CURRENT=#{current_solution_size} I=#{i} INDEX=#{index} J=#{j} ARR[j]=#{arr[j]}"

      longest_solution_size = current_solution_size
      i1 = index + 1
      i2 = j + 1
      break
    end
  end

  [i1, i2]
end

puts "First solution: #{first_solution(arr, s)}"
