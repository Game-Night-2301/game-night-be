require 'rails_helper'

RSpec.describe GameFactory do
  describe "creation" do
    before do
      @game_factory = GameFactory.new
      @game_data = [
        {
          id: "8Hnd9fn9",
          name: "Hodor",
          min_players: 4,
          max_players: 4,
          min_playtime: 82,
          max_playtime: 90,
          description: "It's a game, what do you want?",
          image_url: "www.game",
          average_user_rating: 5.03,
          average_strategy_complexity: 8.3
        },
        {
          id: "93h4938h4",
          name: "Shmodor",
          min_players: 1,
          max_players: 5,
          min_playtime: 60,
          max_playtime: 100,
          description: "It's not a game, what do you want?",
          image_url: "www.game",
          average_user_rating: 5.03,
          average_strategy_complexity: 8.3
        }
      ]
    end

    it "exists" do
      expect(@game_factory).to be_a(GameFactory)
    end

    it "makes games" do
      expect(Game.all.count).to eq(0)
      @game_factory.build_games(@game_data)
      
      expect(Game.all.count).to eq(2)
      expect(Game.first.name).to eq("Hodor")
      expect(Game.last.name).to eq("Shmodor")
    end
  end
end