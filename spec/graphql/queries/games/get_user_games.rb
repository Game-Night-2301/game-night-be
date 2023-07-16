# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Types::QueryType, vcr: { record: :new_episodes } do
  describe "gets user games" do
    it "can access user's game colleciton" do
      user = create(:user, id: 1000, city: "Denver", state: "Colorado")
      create_list(:game, 5)
      (Game.first.id..Game.last.id).each do |i|
        UserGame.create!(user_id: user.id, game_id: i)
      end

      result = GameNightBeSchema.execute(query).as_json

      expect(result["data"]["user"]["ownedGames"]).to be_a(Array)
      expect(result["data"]["user"]["ownedGames"].count).to eq(5)
    end
  end

  def query
    <<~GQL
      query {
      user(id: 1000 ) {
        ownedGames {
          id
          bgaId
          name
          minPlayers
          maxPlayers
          minPlaytime
          maxPlaytime
          description
          imageUrl
          averageUserRating
          averageStrategyComplexity
        }
        }
      }
    GQL
  end
end
