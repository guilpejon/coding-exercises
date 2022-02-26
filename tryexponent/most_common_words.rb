# We want to find the most frequently used words in a long string of text.
# Write a function most_common_words(text) that returns an array containing words 
# with their frequencies, sorted from most common to least common, with ties broken by 
# alphabetic order.
#For greater accuracy, your solution should ignore punctuation and capitalization.

text = 'It was the best of times, it was the worst of times.'
answer = {
  'it' => 2,
  'of' => 2,
  'the' => 2,
  'times' => 2,
  'was' => 2,
  'best' => 1,
  'worst' => 1
}

def most_common_words(text)
  hash = Hash.new(0)

  # create hash with only letters
  text.gsub(/[^a-zA-Z ]/, "").split(" ").each do |word|
    hash[word.downcase] += 1
  end

  # sort by number of occurences and group them
  hash_group = hash.sort_by{|k,v| v}.reverse.to_h.group_by{|k,v| v}

  # sort words with the same amount of occurences alphabetically
  # create new hash with the result
  answer = {}
  hash_group.each do |group, hashes|
    hashes.sort_by{|k,v| k}.each do |k,v|
      answer[k] = v
    end
  end

  answer
end

# Space: O(n)
# Time: O(nlog(n)) because of the sorting
def most_common_words2(text)
  hash = Hash.new(0)

  # create hash with only letters
  text.gsub(/[^a-zA-Z ]/, "").split(" ").each do |word|
    hash[word.downcase] += 1
  end

  # sort by number of occurences and group them
  hash.sort_by{|k,v| k[0]}.sort_by{|k,v| -v}.to_h
end

puts answer
puts most_common_words(text)
puts most_common_words2(text)
