class Board
  BOARD_SIZE = 9

  def initialize
    @board = []
  end

  def empty?
    board.empty?
  end

  def push(item)
    board.push(item)
  end

  def full?
    board.size >= BOARD_SIZE
  end

  private
  attr_accessor :board
end
