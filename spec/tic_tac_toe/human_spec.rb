require 'tic_tac_toe/human'

describe 'Human' do

  let(:board)   { Board.new }
  let(:console) { instance_double('Console', {
    :draw_board => '',
    :prompt => 4
    }) }
  let(:human)   { Human.new(:X, console) }

  context '#move' do
    it 'Displays the board' do
      expect(console).to receive(:draw_board)
      human.move(board)
    end

    it 'Takes an input from the user.' do
      expect(console).to receive(:prompt)
      human.move(board)
    end

    it 'Makes a move on the board' do
      human.move(board)
      expect(board.empty?).to eq(false)
    end
  end
end