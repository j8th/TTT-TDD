require 'tic_tac_toe/game'

class AI

  attr_reader :token

  def initialize(token)
    @token = token
  end

  def move(board)
    return nil if board.full?

    enemy_token = discover_enemy_token(board)
    open_spots = get_open_spots(board)
    games = Hash.new

    open_spots.each do |i|
      board_copy = Marshal.load(Marshal.dump(board))
      board_copy.place(token, i)
      game = Game.new(board_copy, AI.new(enemy_token), AI.new(token))
      if game.winner == token
        board.place(token, i)
        return
      end
      games[i] = game
    end

    scores = Hash.new

    games.each do |i, game|
      game.play
      scores[i] = 1 if game.winner == token
      scores[i] = -1 if game.winner == enemy_token
      scores[i] = 0 if game.winner.nil? and game.game_over?
    end

    max = scores.max_by { |k, v| v }
    spot = max[0]
    board.place(token, spot)
  end

  def evaluate_board(board)
    enemy_token = discover_enemy_token(board)
    game = Game.new(board, AI.new(token), AI.new(enemy_token))
    return 1 if game.winner == token
    return -1 if game.winner == enemy_token
    return 0 if game.winner.nil? and game.game_over?
  end

  private
  # TODO:  Messy, reconsider this later.
  # Determine the enemy token.
  # Anything we find on the board that is not our token is considered the 'enemy_token'
  # We assume there is only one enemy token.
  # If we do not find any enemy tokens on the board, we assume the enemy token to be 'O',
  #   or we assume it to be 'X' if our own token is 'O'.
  def discover_enemy_token(board)
    enemy_token = nil
    (0..Board::BOARD_SIZE-1).each do |i|
      enemy_token = board[i] if board[i] != token and board[i] != nil
    end
    if enemy_token.nil?
      enemy_token = token == :X ? :O : :X
    end
    enemy_token
  end

  def get_open_spots(board)
    open_spots = Array.new
    (0..Board::BOARD_SIZE-1).each do |i|
      open_spots.push(i) if board[i].nil?
    end
    open_spots
  end

end