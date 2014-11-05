class Game

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
      return @player1.token if line.values.all? { |v| v == @player1.token }
      return @player2.token if line.values.all? { |v| v == @player2.token }
    end
    nil
  end

  def turn
    @player1.move(@board)
  end

end
