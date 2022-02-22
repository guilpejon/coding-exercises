##### DESCRIPTION #####
# Write a method to replace all spaces in a string with '%20'.
# You may assume that the string has sufficient space at the end to hold the additional characters,
# and that you are given the "true" length of the string. 
##### INPUT #####
string1 = "Mr John Smith"
length1 = 13
output1 = "Mr%20John%20Smith"

# Time complexity: T(n) = O(n)
# Space complexity: S(n) = O(n)
def first_solution(string1, length1)
  string2 = ""
  string1.chars.each_with_index do |c, index|
    if c == " "
      string2 << "%20"
    else
      string2 << c
    end
  end
  string2
end

# Time complexity: T(n) =
# Space complexity: S(n) =
# HASH
def second_solution(string1, length1)
end

# Time complexity: T(n) =
# Space complexity: S(n) =
def third_solution(string1, length1)
end

puts "###############################"
puts "INPUT: ['#{string1}','#{length1}']"
puts "OUTPUT: #{output1}"
puts "###############################"
puts "1st: #{first_solution(string1, length1)} (#{(output1 == first_solution(string1, length1)) ? "RIGHT" : "WRONG"})"
puts "2nd: #{second_solution(string1, length1)} (#{(output1 == second_solution(string1, length1)) ? "RIGHT" : "WRONG"})"
puts "3rd: #{third_solution(string1, length1)} (#{(output1 == third_solution(string1, length1)) ? "RIGHT" : "WRONG"})"
