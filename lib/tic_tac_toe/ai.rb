class AI

  attr_reader :token

  def initialize(token)
    @token = token
  end

  def move(board)
    return nil if board.full?
    i = 0 + rand(9)
    if board[i].nil?
      board.place(token, i)
    else
      move(board)
    end
  end

end