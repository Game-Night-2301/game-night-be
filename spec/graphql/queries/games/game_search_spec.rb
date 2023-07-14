#frozen_string_literal: true

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
end