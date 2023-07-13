# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'returns a random game' do
    it 'can query a random game' do
      create_list(:game, 5)
      
      result = GameNightBeSchema.execute(query).as_json

      game = Game.find(result['data']['randomGame']['id'].to_i)

      expect(result['data']['randomGame']['id']).to eq(game.id.to_s)
      expect(result['data']['randomGame']['name']).to eq(game.name)
      expect(result['data']['randomGame']['minPlayers']).to eq(game.min_players)
      expect(result['data']['randomGame']['maxPlayers']).to eq(game.max_players)
      expect(result['data']['randomGame']['minPlaytime']).to eq(game.min_playtime)
      expect(result['data']['randomGame']['maxPlaytime']).to eq(game.max_playtime)
      expect(result['data']['randomGame']['description']).to eq(game.description)
      expect(result['data']['randomGame']['imageUrl']).to eq(game.image_url)
      expect(result['data']['randomGame']['averageUserRating']).to eq(game.average_user_rating)
      expect(result['data']['randomGame']['averageStrategyComplexity']).to eq(game.average_strategy_complexity)
    end
  end

  def query
    <<~GQL
    query {
      randomGame {
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