def is_power_of_four(n)
  return false if n.negative? || n == 0

  Rational(Math.log(n, 4)).denominator == 1
end

puts is_power_of_four(16) == true
puts is_power_of_four(5) == false
puts is_power_of_four(1) == true
puts is_power_of_four(0) == false
puts is_power_of_four(-1) == false
