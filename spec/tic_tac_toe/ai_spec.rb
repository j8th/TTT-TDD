require 'tic_tac_toe/board'
require 'tic_tac_toe/ai'
require 'pry'

describe 'AI' do

  let(:board) { Board.new }
  let(:ai1) { AI.new(:X) }
  let(:ai2) { AI.new(:O) }

  context '#initialize' do
    it 'Sets a token for the AI.' do
      ai = AI.new(:O)
      expect(ai.token).to eq(:O)
    end
  end

  context '#move' do
    it 'makes a move on a board.' do
      ai1.move(board)
      expect(board.empty?).to eq(false)
    end

    it 'makes a move on a non-empty board' do
      board.place(ai1.token, 0)
      board.place(ai2.token, 4)
      board.place(ai1.token, 2)

      ai1.move(board)

      tokens = []
      (0..8).each do |i|
        tokens.push(board[i]) unless board[i].nil?
      end

      expect(tokens.count).to eq(4)
    end

    it 'blocks a win for the opposing player.' do
      board.place(ai1.token, 0)
      board.place(ai1.token, 1)
      ai2.move(board)
      expect(board[2]).to eq(ai2.token)

      board = Board.new
      board.place(ai2.token, 0)
      board.place(ai2.token, 4)
      ai1.move(board)
      expect(board[8]).to eq(ai1.token)
    end

    it 'takes a win for itself' do
      board.place(ai1.token, 0)
      board.place(ai1.token, 1)
      board.place(ai2.token, 3)
      ai1.move(board)
      expect(board[2]).to eq(ai1.token)

      board = Board.new
      board.place(ai1.token, 4)
      board.place(ai1.token, 3)
      board.place(ai2.token, 6)
      ai1.move(board)
      expect(board[5]).to eq(ai1.token)
    end
  end
end