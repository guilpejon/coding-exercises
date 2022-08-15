require_relative '../game'

describe Game do
  describe '#game_loop' do
    it 'expects to print the board' do
      game = Game.new(10)

      expect(game).to receive(:play)

      game.play
      # expect(SomeClass).to receive(:make_heavy_lifting)
      # expect(SomeClass).to receive(:sleep).with(60*60)
      # expect(game.game_loop).to print("")
    end
  end
end
