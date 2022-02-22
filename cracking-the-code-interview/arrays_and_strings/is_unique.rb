##### DESCRIPTION #####
# Implement an algorithm to determine if a string has all unique characters.
# What if you cannot use additional data structures? 
##### INPUT #####
string1 = "characters"
output1 = false
string2 = "chrates"
output2 = true

# Time complexity: T(n) = O(n) # or O(1) because we will never go over ASCII chracterrs' length
# Space complexity: S(n) = O(1) # size of the hash will never be bigger than ASCII characters' length
def first_solution(string)
  return false if string.size > 128

  hash = {}
  string.chars.each do |c|
    return false if hash[c] == 1

    hash[c] = 1 if hash[c].nil?
  end
  true
end

# Time complexity: T(n) = O(n) # or O(1) because we will never go over ASCII chracterrs' length
# Space complexity: S(n) = O(1) # size of the hash will never be bigger than ASCII characters' length
def second_solution(string)
  return false if string.size > 128

  string.chars.group_by{|c| c}.all? {|k,v| v.size <=1 }
end

# Time complexity: T(n) = O(n^2)
# Space complexity: S(n) = O(1)
def third_solution(string)
  return false if string.size > 128

  string.chars.each_with_index do |c, i1|
    string.chars.each_with_index do |c2, i2|
      next if i1 == i2

      return false if c == c2
    end
  end
  true
end

puts
puts "FIRST SOLUTION"
puts "IN: '#{string1}'. OUT: #{output1}. SOLUTION: #{first_solution(string1)}"
puts "IN: '#{string2}'. OUT: #{output2}. SOLUTION: #{first_solution(string2)}"
puts
puts "SECOND SOLUTION"
puts "IN: '#{string1}'. OUT: #{output1}. SOLUTION: #{second_solution(string1)}"
puts "IN: '#{string2}'. OUT: #{output2}. SOLUTION: #{second_solution(string2)}"
puts
puts "THIRD SOLUTION"
puts "IN: '#{string1}'. OUT: #{output1}. SOLUTION: #{third_solution(string1)}"
puts "IN: '#{string2}'. OUT: #{output2}. SOLUTION: #{third_solution(string2)}"
