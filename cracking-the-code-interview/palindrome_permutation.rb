##### DESCRIPTION #####
# Given a string, write a function to check if it is a permutation of a palindrome.
# A palindrome is a word or phrase that is the same forwards and backwards. A permutation
# is a rearrangement of letters. The palindrome does not need to be limited to just dictionary words
##### INPUT #####
string1 = "Tact Coa"
output1 = true
string2 = "aaab"
output2 = false

# Time complexity: T(n) = O(n)
# Space complexity: S(n) = O(1)
# HASH
def first_solution(string1)
  string1 = string1.tr(' ','')

  hash = Hash.new(0)
  string1.downcase.chars.each do |c|
    hash[c] += 1
  end

  return true if hash.all? { |k,v| v % 2 == 0 }

  return true if odd_letters = hash.select { |k,v| v % 2 != 0 }.size == 1

  false
end

# Time complexity: T(n) = O(n)
# Space complexity: S(n) = O(1)
# HASH
def second_solution(string1)
  string1 = string1.tr(' ','')

  hash = Hash.new(0)
  odd_letters = 0
  string1.downcase.chars.each do |c|
    hash[c] += 1

    if hash[c] % 2 != 0
      odd_letters += 1
    else
      odd_letters -= 1
    end
  end

  return true if hash.all? { |k,v| v % 2 == 0 } || odd_letters == 1

  false
end

# Time complexity: T(n) =
# Space complexity: S(n) =
def third_solution(string1)
end

puts "###############################"
puts "INPUT: ['#{string1}']"
puts "OUTPUT: #{output1}"
puts "###############################"
puts "1st: #{first_solution(string1)} (#{(output1 == first_solution(string1)) ? "RIGHT" : "WRONG"})"
puts "2nd: #{second_solution(string1)} (#{(output1 == second_solution(string1)) ? "RIGHT" : "WRONG"})"
puts "3rd: #{third_solution(string1)} (#{(output1 == third_solution(string1)) ? "RIGHT" : "WRONG"})"
puts
puts "###############################"
puts "INPUT: ['#{string2}']"
puts "OUTPUT: #{output2}"
puts "###############################"
puts "1st: #{first_solution(string2)} (#{(output2 == first_solution(string2)) ? "RIGHT" : "WRONG"})"
puts "2nd: #{second_solution(string2)} (#{(output2 == second_solution(string2)) ? "RIGHT" : "WRONG"})"
puts "3rd: #{third_solution(string2)} (#{(output2 == third_solution(string2)) ? "RIGHT" : "WRONG"})"
