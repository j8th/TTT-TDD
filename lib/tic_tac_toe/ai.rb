class AI

  attr_reader :token

  def initialize(token)
    @token = token
  end

  def move(board)
    board.place(token, 2)
  end

end