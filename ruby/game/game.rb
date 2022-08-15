require_relative 'board'

class Game
  def initialize(board_size)
    @board = Board.new(board_size)
  end

  def play
    Kernel.loop do
      game_loop
    end
  rescue SystemExit, Interrupt
    puts "\nExiting.."
    exit
  end

  private

  def game_loop
    @board.print
    puts "\nTurn left: L. Turn right: R. Move: M"
    input = $stdin.gets.chomp
    case input
    when 'L'
      @board.turn_robot_left
    when 'R'
      @board.turn_robot_right
    when 'M'
      @board.move_robot
    else
      puts "Invalid input!\n\n"
    end
    @board.update_board
  end
end
