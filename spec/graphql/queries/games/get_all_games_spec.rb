# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'display all games' do
    it 'can query all games' do
      game = create(:game)
      create_list(:game, 4)

      result = GameNightBeSchema.execute(query).as_json

      expect(result['data']['games']).to be_an(Array)
      expect(result['data']['games'].count).to eq(5)

      expect(result['data']['games'][0]['id']).to eq(game.id.to_s)
      expect(result['data']['games'][0]['name']).to eq(game.name)
      expect(result['data']['games'][0]['minPlayers']).to eq(game.min_players)
      expect(result['data']['games'][0]['maxPlayers']).to eq(game.max_players)
      expect(result['data']['games'][0]['minPlaytime']).to eq(game.min_playtime)
      expect(result['data']['games'][0]['maxPlaytime']).to eq(game.max_playtime)
      expect(result['data']['games'][0]['description']).to eq(game.description)
      expect(result['data']['games'][0]['imageUrl']).to eq(game.image_url)
      expect(result['data']['games'][0]['averageUserRating']).to eq(game.average_user_rating)
      expect(result['data']['games'][0]['averageStrategyComplexity']).to eq(game.average_strategy_complexity)
    end
  end

  def query
    <<~GQL
      query {
        games {
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
