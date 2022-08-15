# You are given a string s. We want to partition the string into as many parts
# as possible so that each letter appears in at most one part.
# Note that the partition is done so that after concatenating all the parts in
# order, the resultant string should be s.
# Return a list of integers representing the size of these parts.

def partition_labels(s)
  letters_hash = Hash.new(0)
  s.split('').each do |letter|
    letters_hash[letter] += 1
  end

  split_hash = Hash.new(0)
  answer = []
  (0...s.size).each do |i|
    stop_split = true
    split_hash[s[i]] += 1

    split_hash.each do |letter, occurences|
      if occurences < letters_hash[letter]
        stop_split = false
        break
      end
    end

    if stop_split
      answer << split_hash.sum { |_k, v| v }
      split_hash = Hash.new(0)
    end
  end
  answer
end

s = 'ababcbacadefegdehijhklij'
p partition_labels(s)
