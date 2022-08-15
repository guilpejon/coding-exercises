# frozen_string_literal: true

require_relative 'reader'

file_name = ARGV[0]
number_of_lines = ARGV[1].nil? ? 10 : ARGV[1].to_i

puts Reader.new(
  file_name,
  number_of_lines
).tail
