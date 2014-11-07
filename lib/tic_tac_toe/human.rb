class Human
  def initialize(token, ui)
    @token = token
    @ui = ui
  end

  def move(board)
    @ui.draw_board(board)
    @ui.prompt
  end
end