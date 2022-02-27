# Write a function find_primes(n) that returns all 
# prime numbers less than or equal to n.
# find_primes(1)  # => []
# find_primes(5)  # => [2, 3, 5]
# find_primes(20) # => [2, 3, 5, 7, 11, 13, 17, 19]

# Time O(n^2)
def find_primes(n)
  res = []

  (2..n).each do |candidate|
    res << candidate if is_prime?(candidate)
  end

  res
end

def is_prime?(n)
  return false if n == 0 || n == 1

  (2..n-1).each do |number|
    return false if n % number == 0
  end

  true
end

# Time O(n - 2) * O(m) = O(nm)
def find_primes2(n)
  res = []

  (2..n).each do |candidate|
    is_prime = true

    res.each do |response|
      is_prime = false if candidate % response == 0 
    end

    res << candidate if is_prime
  end

  res
end

puts find_primes2(20)
