require 'tic_tac_toe/game'

describe Game do
  context '#game_over?' do
    it 'returns false for a game with a new board' do
      board = Board.new
      game  = Game.new(board: board)
      expect(game.game_over?).to eq(false)
    end
  end
end
