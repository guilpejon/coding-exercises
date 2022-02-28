# You and your friend have decided to start an international 
# trading business. You want to earn a profit through some ol' 
# fashioned arbitrage: You'll buy widgets in one country and sell 
# them in another at a higher price. Your friend has already found 
# the current market prices for widgets in cities around the world,
# and you'd like to use this data to pick which cities to buy and sell 
# widgets in.

# Write a function max_profit(prices) that efficiently finds the two cities
# that maximize your profit (i.e. largest difference in prices).

# Input: A dictionary with cities as keys and prices as values 
# Output: An array (or tuple) containing the names of the cities (min, max)

prices = {'London': 72, 'New York': 70, 'Tokyo': 67, 'Miami': 62}

# Time O(nlog(n))
def max_profit(prices)
  prices = prices.sort_by{|k,v| v}.to_h
  [prices.keys.first, prices.keys.last]
end

# Time O(n)
def max_profit2(prices)
  min = 999_999
  min_index = -1
  max = -1
  max_index = -1
  prices.each_with_index do |price, index|
    if price.last < min
      min = price.last
      min_index = index
    end

    if price.last > max
      max = price.last
      max_index = index
    end
  end

  [prices.keys[min_index],prices.keys[max_index]]
end

puts max_profit(prices) # => ('Miami', 'London')
puts max_profit2(prices) # => ('Miami', 'London')
