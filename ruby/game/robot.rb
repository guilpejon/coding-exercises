class Robot
  def initialize
    @x_position = 0
    @y_position = 0
    @facing = 'D'
  end

  attr_accessor :x_position, :y_position, :facing

  def move(board)
    case @facing
    when 'D'
      new_y = @y_position + 1
      return if new_y > board.size - 1

      @y_position = new_y
    when 'R'
      new_x = @x_position + 1
      return if new_x > board.size - 1

      @x_position = new_x
    when 'L'
      new_x = @x_position - 1
      return if new_x < 0

      @x_position = new_x
    when 'U'
      new_y = @y_position - 1
      return if new_y < 0

      @y_position = new_y
    end
  end

  def turn_left
    case @facing
    when 'D'
      @facing = 'R'
    when 'R'
      @facing = 'U'
    when 'L'
      @facing = 'D'
    when 'U'
      @facing = 'L'
    end
  end

  def turn_right
    case @facing
    when 'D'
      @facing = 'L'
    when 'R'
      @facing = 'D'
    when 'L'
      @facing = 'U'
    when 'U'
      @facing = 'R'
    end
  end
end
