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
      # No, this is a state where ai2 has already won, so it is not
      # reasonable to expect the AI to move in space 8.
      #board = Board.new
      #board.place(ai2.token, 0)
      #board.place(ai1.token, 1)
      #board.place(ai2.token, 4)
      #ai1.move(board)
      #expect(board[8]).to eq(ai1.token)

      # Nope, this one too!
      #board.place(ai1.token, 0)
      #board.place(ai2.token, 3)
      #board.place(ai1.token, 1)
      #ai2.move(board)
      #expect(board[2]).to eq(ai2.token)

      # Finally, a reasonable test.
      board.place(ai1.token, 4)
      board.place(ai2.token, 0)
      board.place(ai1.token, 5)
      ai2.move(board)
      expect(board[3]).to eq(ai2.token)
      # And another this test keeps going.
      # Each move is a block, so we should reasonable expect 2 AI's
      # to play the game out this way.
      ai1.move(board)
      expect(board[6]).to eq(ai1.token)
      ai2.move(board)
      expect(board[2]).to eq(ai2.token)
      ai1.move(board)
      expect(board[1]).to eq(ai1.token)
      ai2.move(board)
      expect(board[7]).to eq(ai2.token)

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

    it 'takes a win before it takes a block' do
      board.place(ai1.token, 2)
      board.place(ai1.token, 5)
      board.place(ai2.token, 1)
      board.place(ai2.token, 4)
      ai1.move(board)
      expect(board[8]).to eq(ai1.token)
    end
  end



  context '#evaluate_board' do
    it 'returns 1 for a board the AI wins' do
      board.place(ai1.token, 0)
      board.place(ai1.token, 1)
      board.place(ai1.token, 2)
      expect(ai1.evaluate_board(board)).to eq(1)
    end

    it 'returns -1 for a board the AI loses' do
      board.place(ai1.token, 0)
      board.place(ai1.token, 1)
      board.place(ai1.token, 2)
      expect(ai2.evaluate_board(board)).to eq(-1)
    end

    it 'returns 0 for a draw game' do
      board.place(ai1.token, 0)
      board.place(ai2.token, 4)
      board.place(ai1.token, 2)
      board.place(ai2.token, 1)
      board.place(ai1.token, 7)
      board.place(ai2.token, 6)
      board.place(ai1.token, 3)
      board.place(ai2.token, 5)
      board.place(ai1.token, 8)
      expect(ai2.evaluate_board(board)).to eq(0)
    end

    it 'returns nil for a game that is still in progress' do
      board.place(ai1.token, 0)
      expect(ai1.evaluate_board(board)).to be_nil
    end

    it 'returns nil for a new game with an empty board' do
      expect(ai2.evaluate_board(board)).to be_nil
    end
  end
end