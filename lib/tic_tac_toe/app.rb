class App

  def self.start
    console = Console.new
    player1 = Human.new(:X, console)
    player2 = AI.new(:O)

    game = Game.new(Board.new, player1, player2)
    game.play
  end

end