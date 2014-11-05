require 'tic_tac_toe/ai'

describe 'AI' do

  let(:board) { Board.new }
  let(:ai) { AI.new(:X) }

  context '#initialize' do
    it 'Sets a token for the AI.' do
      ai = AI.new(:O)
      expect(ai.token).to eq(:O)
    end
  end

  context '#move' do
    it 'makes a move on a board.' do
      ai.move(board)
      expect(board.empty?).to eq(false)
    end

    it 'makes a move on a non-empty board' do
      board.place(Game::PLAYER1_TOKEN, 0)
      board.place(Game::PLAYER2_TOKEN, 4)
      board.place(Game::PLAYER1_TOKEN, 2)

      ai.move(board)

      tokens = []
      (0..8).each do |i|
        tokens.push(board[i]) unless board[i].nil?
      end

      expect(tokens.count).to eq(4)
    end

    xit 'blocks a win for the opposing player.' do
      board.place(:O, 0)
      board.place(:O, 1)
      ai.move(board)
      expect(board[2]).to eq(:X)

      board = Board.new
      board.place(:O, 0)
      board.place(:O, 4)
      ai.move(board)
      expect(board[8]).to eq(:X)
    end
  end
end