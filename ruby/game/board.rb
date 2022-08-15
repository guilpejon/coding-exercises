require_relative 'robot'

class Board
  def initialize(size)
    @size = size
    @board = Array.new(@size, 0).map do
      Array.new(@size, 0)
    end
    @robot = Robot.new
    @board[@robot.y_position][@robot.x_position] = @robot.facing
  end

  attr_accessor :robot, :size, :board

  def print
    @board.each do |line|
      puts line.join(',')
    end
  end

  def update_board
    @board = Array.new(size, 0).map do
      Array.new(size, 0)
    end
    @board[@robot.y_position][@robot.x_position] = @robot.facing
  end

  def move_robot
    @robot.move(self)
  end

  def turn_robot_left
    @robot.turn_left
  end

  def turn_robot_right
    @robot.turn_right
  end
end
