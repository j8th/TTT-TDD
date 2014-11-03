require 'spec_helper'
require 'tic_tac_toe/board'

describe Board do
  let(:board) { Board.new }

  context '#empty?' do
    it 'returns true when the board is empty' do
      expect(board.empty?).to eq(true)
    end

    it 'returns false when the board is not empty' do
      board.push('something')
      expect(board.empty?).to eq(false)
    end
  end

  context '#full?' do
    it 'returns false with a new board' do
      expect(board.full?).to eq(false)
    end

    it 'returns true when the board is full.' do
      fill_board
      expect(board.full?).to eq(true)
    end
  end

  context '#[]' do
    it 'Gets the value of the given spot' do
      board.push('X')
      expect(board[0]).to eq('X')
    end
  end

  context '#[]=' do
    it 'Sets the value of the spot we give it.' do
      board[3] = 'X'
      expect(board[3]).to eq('X')
    end
  end
end
