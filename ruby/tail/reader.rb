# frozen_string_literal: true

class Reader
  def initialize(file, number_of_lines = 10)
    @file = file
    @number_of_lines = number_of_lines
  end

  def tail
    raise 'Invalid number of lines' unless @number_of_lines.positive?

    parsed_file = []

    File.readlines(@file).reverse.each_with_index do |line, index|
      parsed_file << line
      break if @number_of_lines <= index + 1
    end

    parsed_file.reverse
  end
end
