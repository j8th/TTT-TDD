require 'tic_tac_toe/app'


describe 'App' do

  let(:app) { App.new }

  context '#initialize' do
    it 'creates a game between a human and an ai.' do
      expect(app.human).to be_a Human
      expect(app.ai).to be_a AI
      expect(app.board).to be_a Board
      expect(app.game).to be_a Game
    end
  end

  context '#run' do
    it 'runs the game' do
      # Stub Game.play() so we don't actually run the game.
      allow(app.game).to receive(:play)
      expect(app.game).to receive(:play)
      app.run
    end
  end
end