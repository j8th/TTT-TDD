class Human

  attr_reader :token

  def initialize(token, ui)
    @token = token
    @ui = ui
  end

  def move(board)
    @ui.draw_board(board)
    spot = @ui.prompt
    board[spot].nil? ? board.place(@token, spot) : move(board)
  end
end