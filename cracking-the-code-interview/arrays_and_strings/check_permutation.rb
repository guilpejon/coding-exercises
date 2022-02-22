##### DESCRIPTION #####
# Given two strings, write a method to decide if one is a permutation of the other
##### INPUT #####
string1 = "god"
string2 = "dog"
output1 = true
string3 = "cat"
string4 = "ball"
output2 = false

# Time complexity: T(n) = O(nlogn) + O(nlogn) = O(nlogn)
# Space complexity: S(n) = O(n) + O(n) = O(n)
# SORTING
def first_solution(string1, string2)
  return false if string1.size != string2.size

  string1 = string1.chars.sort
  string2 = string2.chars.sort

  string1 == string2
end

# Time complexity: T(n) = O(n) + O(n) = O(n)
# Space complexity: S(n) = O(n)
# HASH
def second_solution(string1, string2)
  h1 = Hash.new(0)

  string1.chars.each do |c|
    h1[c] += 1  
  end

  string2.chars.each do |c|
    h1[c] -= 1
    return false if h1[c] < 0
  end
  true
end

# Time complexity: T(n) =
# Space complexity: S(n) =
def third_solution(string1, string2)
end

puts "###############################"
puts "INPUT: ['#{string1}','#{string2}']"
puts "OUTPUT: #{output1}"
puts "###############################"
puts "1st: #{first_solution(string1, string2)} (#{(output1 == first_solution(string1, string2)) ? "RIGHT" : "WRONG"})"
puts "2nd: #{second_solution(string1, string2)} (#{(output1 == second_solution(string1, string2)) ? "RIGHT" : "WRONG"})"
puts "3rd: #{third_solution(string1, string2)} (#{(output1 == third_solution(string1, string2)) ? "RIGHT" : "WRONG"})"
puts
puts "###############################"
puts "INPUT: ['#{string3}','#{string4}']"
puts "OUTPUT: #{output2}"
puts "###############################"
puts "1st: #{first_solution(string3, string4)} (#{(output2 == first_solution(string3, string4)) ? "RIGHT" : "WRONG"})"
puts "2nd: #{second_solution(string3, string4)} (#{(output2 == second_solution(string3, string4)) ? "RIGHT" : "WRONG"})"
puts "3rd: #{third_solution(string3, string4)} (#{(output2 == third_solution(string3, string4)) ? "RIGHT" : "WRONG"})"
