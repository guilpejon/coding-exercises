##### DESCRIPTION #####
# Implement a method to perform basic string compression using the 
# counts of repeated characters. For example, the string aabcccccaaa 
# would become a2blc5a3. If the "compressed" string would not become
# smaller than the original string, your method should return the
# original string. You can assume the string has only uppercase and 
# lowercase letters (a - z).
##### INPUT #####
string1 = "aabcccccaaa"
output1 = "a2b1c5a3"

# Time complexity: T(n) = O(n)
# Space complexity: S(n) = O(k) -> k is the amount of sequences
def first_solution(string1)
  last_letter = ""
  answer = ""
  letter_count = 0
  string1.chars.each_with_index do |c, index|
    if c != last_letter && letter_count != 0 # found a different char
      answer << "#{last_letter}#{letter_count}"
      letter_count = 0
    elsif index == string1.size - 1 # end of the string
      answer << "#{last_letter}#{letter_count+1}"
    end

    return string1 if answer.size > string1.size

    letter_count += 1
    last_letter = c
  end
  answer.size > string1.size ? string1 : answer
end

# Time complexity: T(n) =
# Space complexity: S(n) =
def second_solution(string1)
end

# Time complexity: T(n) =
# Space complexity: S(n) =
def third_solution(string1)
end

puts "###############################"
puts "INPUT: ['#{string1}']"
puts "OUTPUT: #{output1}"
puts "###############################"
first_solution_response = first_solution(string1) 
# second_solution_response = second_solution(string1, string2) 
# third_solution_response = third_solution(string1, string2) 
puts "1st: #{first_solution_response} (#{(output1 == first_solution_response) ? "RIGHT" : "WRONG"})"
# puts "2nd: #{second_solution_response} (#{(output1 == second_solution_response) ? "RIGHT" : "WRONG"})"
# puts "3rd: #{third_solution_response} (#{(output1 == third_solution_response) ? "RIGHT" : "WRONG"})"
# puts
# puts "###############################"
# puts "INPUT: ['#{string3}']"
# puts "OUTPUT: #{output2}"
# puts "###############################"
# first_solution_response = first_solution(string3, string4) 
# second_solution_response = second_solution(string3, string4) 
# third_solution_response = third_solution(string3, string4) 
# puts "1st: #{first_solution_response} (#{(output2 == first_solution_response) ? "RIGHT" : "WRONG"})"
# puts "2nd: #{second_solution_response} (#{(output2 == second_solution_response) ? "RIGHT" : "WRONG"})"
# puts "3rd: #{third_solution_response} (#{(output2 == third_solution_response) ? "RIGHT" : "WRONG"})"
# puts
# puts "###############################"
# puts "INPUT: ['#{string5}']"
# puts "OUTPUT: #{output3}"
# puts "###############################"
# first_solution_response = first_solution(string5, string6) 
# second_solution_response = second_solution(string5, string6) 
# third_solution_response = third_solution(string5, string6) 
# puts "1st: #{first_solution_response} (#{(output3 == first_solution_response) ? "RIGHT" : "WRONG"})"
# puts "2nd: #{second_solution_response} (#{(output3 == second_solution_response) ? "RIGHT" : "WRONG"})"
# puts "3rd: #{third_solution_response} (#{(output3 == third_solution_response) ? "RIGHT" : "WRONG"})"
# puts
# puts "###############################"
# puts "INPUT: ['#{string7}']"
# puts "OUTPUT: #{output4}"
# puts "###############################"
# first_solution_response = first_solution(string7, string8) 
# second_solution_response = second_solution(string7, string8) 
# third_solution_response = third_solution(string7, string8) 
# puts "1st: #{first_solution_response} (#{(output4 == first_solution_response) ? "RIGHT" : "WRONG"})"
# puts "2nd: #{second_solution_response} (#{(output4 == second_solution_response) ? "RIGHT" : "WRONG"})"
# puts "3rd: #{third_solution_response} (#{(output4 == third_solution_response) ? "RIGHT" : "WRONG"})"
