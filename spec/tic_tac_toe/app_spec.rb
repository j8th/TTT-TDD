require 'tic_tac_toe/app'


describe 'App' do

  let(:app) { 
    console = Console.new
    app = App.new(AI.new(:X), AI.new(:O), console)
    # Stub Game.play() so we don't actually run the game.
    allow(app.game).to receive(:play)
    app
  }

  context '#initialize' do
    it 'creates a new game' do
      expect(app.game).to be_a Game
    end
  end

  context '#run' do
    it 'runs the game' do
      expect(app.game).to receive(:play)
      app.run
    end

  end
end