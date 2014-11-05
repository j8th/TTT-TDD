require 'tic_tac_toe/game'

class AI

  attr_reader :token

  def initialize(token)
    @token = token
  end

  def move(board)
    return nil if board.full?

    # Determine the enemy token.
    # Anything we find on the board that is not our token is considered the 'enemy_token'
    # We assume there is only one enemy token.
    enemy_token = nil
    (0..Board::BOARD_SIZE-1).each do |i|
      enemy_token = board[i] if board[i] != token and board[i] != nil
    end
    if enemy_token.nil?
      enemy_token = token == :X ? :O : :X
    end

    # Grab all the open spots on the board.
    open_spots = Array.new
    (0..Board::BOARD_SIZE-1).each do |i|
      open_spots.push(i) if board[i].nil?
    end

    
    open_spots.each do |i|
      board_copy = Marshal.load(Marshal.dump(board))
      board_copy.place(enemy_token, i)
      game = Game.new(board_copy, AI.new(token), AI.new(enemy_token))
      if(game.winner == enemy_token)
        board.place(token, i)
        return
      end
    end
    board.place(token, open_spots.first)
  end

end