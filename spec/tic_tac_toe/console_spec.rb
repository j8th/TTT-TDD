require 'tic_tac_toe/console'

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
end