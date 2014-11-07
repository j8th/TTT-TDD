require 'tic_tac_toe/board'
require 'tic_tac_toe/human'
require 'tic_tac_toe/ai'
require 'tic_tac_toe/console'
require 'tic_tac_toe/game'

class App

  attr_accessor :game

  def initialize(player1, player2, console)
    @player1 = player1
    @player2 = player2
    @console = console

    @game = Game.new(Board.new, @player1, @player2)
  end

  def run
    @game.play
  end

end