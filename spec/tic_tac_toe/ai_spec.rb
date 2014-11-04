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
    it 'Given a board instance, it makes a move on the board.' do
      ai.move(board)
      expect(board.empty?).to eq(false)
    end

    xit 'Given a board instance, it blocks a win for the opposing player.' do
      #Tab to here
    end
  end
end