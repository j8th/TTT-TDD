require 'tic_tac_toe/board'
require 'tic_tac_toe/human'
require 'tic_tac_toe/ai'
require 'tic_tac_toe/console'
require 'tic_tac_toe/game'

class App
  
  attr_reader :human, :ai, :board, :game

  def initialize
    @human = Human.new(:O, Console.new)
    @ai = AI.new(:X)
    @board = Board.new
    @game = Game.new(@board, @ai, @human)
  end

  def run
    @game.play
  end

end