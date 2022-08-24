# frozen_string_literal: true

require 'benchmark'

a = Array.new(10_000, rand(1..100_000))
b = Array.new(10_000, rand(1..100_000))
v = 50_000

require 'set'
def set(a, b, v)
  complements = Set.new

  a.each_with_index do |number, _index|
    complements.add(v - number)
  end

  b.each do |number|
    return true if complements.include?(number)
  end

  false
end

def array(a, b, v)
  complements = []

  a.each_with_index do |number, _index|
    complements.push(v - number)
  end

  b.each do |number|
    return true if complements.include?(number)
  end

  false
end

n = 1_000_000
Benchmark.bm do |x|
  x.report { set(a, b, v) }
  x.report { array(a, b, v) }
end
