# Results should be ordered in the following way:
# 1. Exact match
# 2. One of the words is an exact match
# 3. Starts with the searched word
# 4. Rest, ordered alphanumerically

search_string = 'word'

ordered_results = ['Word', 'Microsoft Word', 'Wordpress', '1Password', 'Google Adwords']

results = ordered_results.shuffle

first_results = []
second_results = []
third_results = []
fourth_results = []
results.each do |result|
  if result.downcase == search_string.downcase
    first_results << result
  elsif result.split(' ').map(&:downcase).include? search_string.downcase
    second_results << result
  elsif result[0..search_string.size - 1].downcase == search_string.downcase
    third_results << result
  else
    fourth_results << result
  end
end
results = first_results + second_results + third_results + fourth_results.sort

require 'minitest/autorun'
describe 'search results' do
  it 'should be in correct order' do
    assert_equal ordered_results, results
  end
end
