class Board
  BOARD_SIZE = 9
  BOARD_LINES = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],

    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],

    [0, 4, 8],
    [2, 4, 6]
  ]

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

  def []=(spot, value)
    board[spot] = value
  end

  def [](spot)
    return board[spot]
  end

  def lines
    array = []
    BOARD_LINES.each do |line|
      hash = {}
      line.each do |i|
        hash[i] = board[i]
      end
      array.push(hash)
    end
    array
  end

  private
  attr_accessor :board
end
