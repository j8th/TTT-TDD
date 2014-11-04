class Rules
  def wins?(board, token)
    lines = board.lines
    lines.each do |line|
      return true if line.values.all? {|i| i == token}
    end
    false
  end
end