require 'tic_tac_toe/game'

describe Game do
  let(:board) { Board.new }
  let(:player1) { AI.new(:X) }
  let(:player2) { AI.new(:O) }
  let(:game)  { Game.new(board, player1, player2) }

  context '#game_over?' do
    it 'returns false for a game with a new board' do
      expect(game.game_over?).to eq(false)
    end

    it 'returns true for a game with a winner' do
      board.place(Game::PLAYER1_TOKEN, 0)
      board.place(Game::PLAYER1_TOKEN, 1)
      board.place(Game::PLAYER1_TOKEN, 2)

      expect(game.game_over?).to eq(true)
    end

    it 'returns true for a draw game' do
      # X O X
      # X O O
      # O X X
      board.place(Game::PLAYER1_TOKEN, 0)
      board.place(Game::PLAYER2_TOKEN, 1)
      board.place(Game::PLAYER1_TOKEN, 2)

      board.place(Game::PLAYER1_TOKEN, 3)
      board.place(Game::PLAYER2_TOKEN, 4)
      board.place(Game::PLAYER2_TOKEN, 5)

      board.place(Game::PLAYER2_TOKEN, 6)
      board.place(Game::PLAYER1_TOKEN, 7)
      board.place(Game::PLAYER1_TOKEN, 8)

      expect(game.game_over?).to eq(true)
    end
  end

  context '#winner' do
    it 'returns nil when there is no winner' do
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

  context '#turn' do
    it 'makes a player move on the board' do
      game.turn()
      expect(board.empty?).to eq(false)
    end
  end

end
