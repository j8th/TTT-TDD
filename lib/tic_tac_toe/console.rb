class Console
  def draw_board(board)

    s = []

    (0..Board::BOARD_SIZE).each do |i|
      if board[i].nil?
        s[i] = i
      else
        s[i] = board[i]
      end
    end
    string = <<EOS
 #{s[0]} | #{s[1]} | #{s[2]} 
-----------
 #{s[3]} | #{s[4]} | #{s[5]} 
-----------
 #{s[6]} | #{s[7]} | #{s[8]} 
EOS
    puts string
  end

  def prompt
    STDIN.gets.to_i
  end

  def msg(text)
    puts text
  end

end