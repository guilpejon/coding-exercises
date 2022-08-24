# Given a grid, find the maximum number of connected colors
#
# Example grid:
# $ $ @ %
# $ @ % @
# % @ @ @
# Answer: 5 (because of 5 connected @ at the bottom right)

# Time complexity = O(n) because you only visit each node once
def max_connections
  max_connections = -1

  (0..@grid_size_y - 1).each do |y|
    (0..@grid_size_x - 1).each do |x|
      max_connections = [max_connections, find_connections(y, x, @grid[y][x])].max
    end
  end

  max_connections
end

def find_connections(y, x, color)
  return 0 if out_of_bounds?(y, x)
  return 0 if already_visited?(y, x)

  new_color = @grid[y][x]
  return 0 unless same_color?(new_color, color)

  @visited_grid[y][x] = true

  1 + find_connections(y + 1, x, color) + find_connections(y, x + 1, color) + find_connections(y - 1, x, color) + find_connections(y, x - 1, color)
end

def out_of_bounds?(y, x)
  return true if y >= @grid_size_y || x >= @grid_size_x || y.negative? || x.negative?
end

def already_visited?(y, x)
  !@visited_grid[y][x].nil?
end

def same_color?(new_color, color)
  new_color == color
end

@grid = []
@grid << %w[G G B R]
@grid << %w[G B R B]
@grid << %w[R B B B]
@grid << %w[R G B G]
@grid_size_y = 4
@grid_size_x = 4
@visited_grid = Array.new(@grid_size_y) { Array.new(@grid_size_x) }

puts max_connections
