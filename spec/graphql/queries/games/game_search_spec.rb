# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Types::QueryType do
  describe "game search" do
    it "returns array of games" do
      create_list(:game, 10)
      game_1 = create(:game, name: "bohnanza")
      create_list(:game, 10)
      game_2 = create(:game, name: "sldfkjbohnanzaw9feheu")
      create_list(:game, 10)
      game_3 = create(:game, name: "This isn't your grandma's bohnanza")
      create_list(:game, 10)

      result = GameNightBeSchema.execute(query).as_json
      expect(result["data"]["gameSearch"][0]["id"]).to eq(game_1.id.to_s)
      expect(result["data"]["gameSearch"][1]["id"]).to eq(game_2.id.to_s)
      expect(result["data"]["gameSearch"][2]["id"]).to eq(game_3.id.to_s)
    end
  end

  describe "sad paths" do
    it "empty results" do
      create_list(:game, 40)
      result = GameNightBeSchema.execute(query).as_json

      expect(result["errors"].first["message"]).to eq("I'm sorry, no games in our database match your search!")
    end
    
    it "bad data type" do
      result = GameNightBeSchema.execute(wrong_data_type_query).as_json

      expect(result["errors"].first["message"]).to eq(
        "Argument 'term' on Field 'gameSearch' has an invalid value (982374). Expected type 'String!'."
      )
    end
  end

  def query
    <<~GQL
      query {
        gameSearch(term: "bohnanza") {
          id
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
    GQL
  end

  def wrong_data_type_query
    <<~GQL
      query {
        gameSearch(term: 982374) {
          id
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
    GQL
  end
end
