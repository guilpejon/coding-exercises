require_relative '../board'

describe Board do
  describe '#print' do
    printed_board = [["D", 0], [0, 0]]

    it 'expects to print the board correctly' do
      expect(Board.new(2).print).to eql(printed_board)
    end
  end

  describe '#update_board' do
    printed_board = [["L", 0], [0, 0]]

    it 'expects to update the board correctly' do
      board = Board.new(2)
      board.turn_robot_right
      board.update_board
      expect(board.print).to eql(printed_board)
    end
  end

  describe 'move_robot' do
  end

  describe 'turn_robot_left' do
  end

  describe 'turn_robot_right' do
    it 'expects the robot to turn right' do
      board = Board.new(2)
      board.move_robot
      expect(board.robot.y_position).to eql(1)
    end
  end
end
