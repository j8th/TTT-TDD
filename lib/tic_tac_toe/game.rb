class Game

  PLAYER1_TOKEN = :X
  PLAYER2_TOKEN = :O

  def initialize(board, player1, player2)
    @board = board
    @player1 = player1
    @player2 = player2
  end

  def game_over?
    return true if @board.full? or not winner.nil?
    false
  end

  def winner
    @board.lines.each do |line|
      return PLAYER1_TOKEN if line.values.all? { |v| v == PLAYER1_TOKEN }
      return PLAYER2_TOKEN if line.values.all? { |v| v == PLAYER2_TOKEN }
    end
    nil
  end

  def turn
    @player1.move(@board)
  end

end
