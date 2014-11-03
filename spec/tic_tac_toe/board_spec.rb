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
end
