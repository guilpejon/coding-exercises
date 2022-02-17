# Given two strings s1 and s2, check it they're anagrams.
# Two strings are anagrams if they're made of the same characters with the same frequencies
# Output: true or false

# Time complexity: T(n) = O(nlogn) + O(nlogn) + n = O(nlogn) -> two sortings (merge sort || heapsort || quicksort) and one comparison
# Space complexity: S(n) = 2n = O(n) -> two hashes with the size of s1||s2
def sort_solution(s1,s2)
  return false if s1.size != s2.size

  s1 = s1.chars.sort.join
  s2 = s2.chars.sort.join

  s1 == s2
end

# Time complexity: T(n) = O(n) + O(n) + O(n) = O(n)
# Space complexity: S(n) = O(n) + O(n) = O(n)
def hash_table(s1,s2)
  return false if s1.size != s2.size

  freq1 = Hash.new(0)
  freq2 = Hash.new(0)

  s1.chars.each do |c|
    freq1[c] += 1
  end

  s2.chars.each do |c|
    freq2[c] += 1
  end

  freq1.each do |k,v|
    return false if freq2[v].nil? || freq2[v] != freq1[v]
  end
  true
end

s1 = "danger"
s2 = "garden"

puts "Ruby solution: #{sort_solution(s1,s2)}"
puts "Hash table solution: #{hash_table(s1,s2)}"
