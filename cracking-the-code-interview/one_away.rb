##### DESCRIPTION #####
# There are three types of edits that can be performed on strings:
# insert a character, remove a character, or replace a character.
# Given two strings, write a function to check if they are one
# edit (or zero edits) away.
##### INPUT #####
string1 = "pale"
string2 = "ple"
output1 = true
string3 = "pales"
string4 = "pale"
output2 = true
string5 = "pale"
string6 = "bale"
output3 = true
string7 = "pale"
string8 = "bae"
output4 = false

# Time complexity: T(n) = O(n)
# Space complexity: S(n) = O(n)
# HASH
def first_solution(string1, string2)
  return false if (string1.size - string2.size).abs > 1

  h1 = string1.chars.group_by{|c| c}
  h2 = string2.chars.group_by{|c| c}

  differences = 0
  h1.each_with_index do |k, index|
    v = k.last
    letter = k.first
    differences += 1 if h2[letter]&.size != v.size
  end

  differences == 1
end

# Time complexity: T(n) =
# Space complexity: S(n) =
def second_solution(string1, string2)
end

# Time complexity: T(n) =
# Space complexity: S(n) =
def third_solution(string1, string2)
end

puts "###############################"
puts "INPUT: ['#{string1}','#{string2}']"
puts "OUTPUT: #{output1}"
puts "###############################"
first_solution_response = first_solution(string1, string2) 
second_solution_response = second_solution(string1, string2) 
third_solution_response = third_solution(string1, string2) 
puts "1st: #{first_solution_response} (#{(output1 == first_solution_response) ? "RIGHT" : "WRONG"})"
# puts "2nd: #{second_solution_response} (#{(output1 == second_solution_response) ? "RIGHT" : "WRONG"})"
# puts "3rd: #{third_solution_response} (#{(output1 == third_solution_response) ? "RIGHT" : "WRONG"})"
puts
puts "###############################"
puts "INPUT: ['#{string3}','#{string4}']"
puts "OUTPUT: #{output2}"
puts "###############################"
first_solution_response = first_solution(string3, string4) 
second_solution_response = second_solution(string3, string4) 
third_solution_response = third_solution(string3, string4) 
puts "1st: #{first_solution_response} (#{(output2 == first_solution_response) ? "RIGHT" : "WRONG"})"
# puts "2nd: #{second_solution_response} (#{(output2 == second_solution_response) ? "RIGHT" : "WRONG"})"
# puts "3rd: #{third_solution_response} (#{(output2 == third_solution_response) ? "RIGHT" : "WRONG"})"
puts
puts "###############################"
puts "INPUT: ['#{string5}','#{string6}']"
puts "OUTPUT: #{output3}"
puts "###############################"
first_solution_response = first_solution(string5, string6) 
second_solution_response = second_solution(string5, string6) 
third_solution_response = third_solution(string5, string6) 
puts "1st: #{first_solution_response} (#{(output3 == first_solution_response) ? "RIGHT" : "WRONG"})"
# puts "2nd: #{second_solution_response} (#{(output3 == second_solution_response) ? "RIGHT" : "WRONG"})"
# puts "3rd: #{third_solution_response} (#{(output3 == third_solution_response) ? "RIGHT" : "WRONG"})"
puts
puts "###############################"
puts "INPUT: ['#{string7}','#{string8}']"
puts "OUTPUT: #{output4}"
puts "###############################"
first_solution_response = first_solution(string7, string8) 
second_solution_response = second_solution(string7, string8) 
third_solution_response = third_solution(string7, string8) 
puts "1st: #{first_solution_response} (#{(output4 == first_solution_response) ? "RIGHT" : "WRONG"})"
# puts "2nd: #{second_solution_response} (#{(output4 == second_solution_response) ? "RIGHT" : "WRONG"})"
# puts "3rd: #{third_solution_response} (#{(output4 == third_solution_response) ? "RIGHT" : "WRONG"})"
