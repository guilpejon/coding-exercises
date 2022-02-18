##### DESCRIPTION #####
# Given two integer arrays, a and b and the target value v,
# determine whether there is a pair of numbers from both of these arrays that
# when added together gets the value v. Returns true if this pairs exists and false otherwise
##### INPUT #####
a = [1, 2, 3]
b = [10, 20, 30, 40]
v = 42
##### OUTPUT #####
# true

# Time complexity: T(n,m) = O(n) * O(m) = O(nm)
# Space complexity: S(n,m) = O(1)
def first_solution(a, b, v)
  a.uniq!
  b.uniq!
  a.each do |i|
    b.each do |j|
      return true if i + j == v
    end
  end
  false
end

# Time complexity: T(n,m) = O(n) + O(m) = O(n)
# Space complexity: S(n,m) = O(n)
require 'set'
def second_solution(a, b, v)
  complements = Set.new

  a.each_with_index do |number, _index|
    complements.add(v - number)
  end

  b.each do |number|
    return true if complements.include?(number)
  end

  false
end

puts "First solution: #{first_solution(a, b, v)}"
puts "Second solution: #{second_solution(a, b, v)}"
