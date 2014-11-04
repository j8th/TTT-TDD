require 'tic_tac_toe/game'

describe Game do
  let(:board) { Board.new }
  let(:game)  { Game.new(board: board) }

  context '#game_over?' do
    it 'returns false for a game with a new board' do
      game  = Game.new(board: board)
      expect(game.game_over?).to eq(false)
    end
  end

  context '#winner' do
    it 'returns nil when there is no winner' do
      game  = Game.new(board: board)
      expect(game.winner).to be_nil
    end

    [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],

      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],

      [0, 4, 8],
      [2, 4, 6]
    ].each do |(a, b, c)|
      it ":X is the winner when its marks are at (#{a}, #{b}, #{c})" do
        board.place(:X, a)
        board.place(:X, b)
        board.place(:X, c)
        expect(game.winner).to eq(:X)
      end
    end
  end
end
