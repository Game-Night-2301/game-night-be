require 'rails_helper'

RSpec.describe Game, type: :model, vcr: { record: :new_episodes } do
  describe "creation and attributes" do
    before do
      game_data = GameService.new.one_random_game
      GameFactory.new.build_one_game(game_data)
      @game = Game.first
    end

    it "exists" do
      expect(@game).to be_a(Game)
      expect(@game.bga_id).to be_a(String)
      expect(@game.name).to be_a(String)
      expect(@game.min_players).to be_a(Integer)
      expect(@game.max_players).to be_a(Integer)
      expect(@game.min_playtime).to be_a(Integer)
      expect(@game.max_playtime).to be_a(Integer)
      expect(@game.description).to be_a(String)
      expect(@game.image_url).to be_a(String)
      expect(@game.average_user_rating).to be_a(Float)
      expect(@game.average_strategy_complexity).to be_a(Float)
    end
  end

  it 'can verify a game' do
    collection = ["Catan", "Betrayal at House on the Hill", "Gloom Haven", "Brass: Birmingham", "Survive: Escape from Atlantis"]
    user_collection = AiService.new.get_games(collection)

    Game.verify_games(user_collection)
  end
end
