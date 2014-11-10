require 'tic_tac_toe/console'
require 'tic_tac_toe/board'

describe 'Console' do

  let(:console) { Console.new }
  let(:board) { Board.new }

  context '#draw_board' do
    it 'Draws the board' do

      board.place(:X, 0)
      board.place(:O, 4)
      board.place(:X, 8)

      string = <<EOS
 X | 1 | 2 
-----------
 3 | O | 5 
-----------
 6 | 7 | X 
EOS

      expect { console.draw_board(board) }.to output(string).to_stdout
    end
  end

  context '#prompt_for_move' do
    it 'Ask the user to make a move and returns the selection.' do
      expect(STDOUT).to receive(:puts).with('Please enter the number where you would like to move.')
      allow(STDIN).to receive(:gets) { "2\n" }

      expect(console.prompt_for_move).to eq(2)
    end
  end

  context '#msg' do
    it 'prints a text message to stdout' do
      expect(STDOUT).to receive(:puts).with('Some message')
      console.msg('Some message')
    end
  end
end