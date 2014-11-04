require 'tic_tac_toe/rules'

describe 'Rules' do

  let(:rules) { Rules.new }
  let(:board) { Board.new }

  context '#wins?' do
    it 'returns true if any line on a given board is all equal to the given token' do
      expect(rules.wins?(board, 'X')).to eq(false)

      board.place('X', 0)

      expect(rules.wins?(board, 'X')).to eq(false)

      board.place('X', 3)
      board.place('X', 6)

      expect(rules.wins?(board, 'X')).to eq(true)
      expect(rules.wins?(board, 'O')).to eq(false)
    end
  end
end
