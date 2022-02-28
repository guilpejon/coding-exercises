# We want to build a simple calculator that can solve arithmetic
# expressions like 2 + 2 or 4 * 5 - 10 * 2. 
# Write a function calc(expr) that accepts a string as input and 
# returns the answer as a number. It should follow the normal order
# of operations and support addition, subtraction, multiplication,
# and division. Don't worry about parentheses or improperly 
# formatted strings.

# Time O(n) ???
# Space O(n) ???
def calc(calculation)
  ["+", "-", "/", "*"].each do |operation|
    if calculation.to_s.include?(operation)
      left, _op, right = calculation.rpartition(operation)

      return calc(left) + calc(right) if operation == "+"
      return calc(left) - calc(right) if operation == "-"
      return calc(left) * calc(right) if operation == "*"
      return calc(left) / calc(right) if operation == "/"
    end
  end

  calculation.strip.to_f
end

puts calc("1 + 1")       # => 2
puts calc("5 - 1 - 1")   # => 3
puts calc("84 / 1 / 2")  # => 42
puts calc("5/2 - 2*3")   # => -3.5
