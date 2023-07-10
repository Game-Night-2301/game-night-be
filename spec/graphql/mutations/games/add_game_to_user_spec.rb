# frozen_string_literal: true

require 'rails_helper'
# This is the add game to user spec file
module Mutations
  # This is the games module for testing
  module Games
    RSpec.describe CreateUserGame, type: :request do
      describe 'resolve' do
        it 'can create a user game' do
          user = create(:user, id: 1)
          game_1 = create(:game)
          game_2 = create(:game)
          game_3 = create(:game, id: 2000)
          UserGame.create(user_id: user.id, game_id: game_1.id)
          UserGame.create(user_id: user.id, game_id: game_2.id)

          expect(user.games.count).to eq(2)
          expect(user.games).to eq([game_1, game_2])
          expect(user.games.first).to eq(game_1)
          expect(user.games.last).to eq(game_2)

          post '/graphql', params: { query: }

          response = JSON.parse(@response.body, symbolize_names: true)
          new_user_game = UserGame.last

          expect(response[:data][:createUserGame][:userGame][:id]).to eq(new_user_game.id.to_s)
          expect(response[:data][:createUserGame][:userGame][:userId]).to eq(user.id)
          # require 'pry'; binding.pry
        end
      end

      def query
        <<~GQL
          mutation {
            createUserGame(input: {
              userId: 1
              gameId: 2000
            }) {
              userGame {
                id
                userId
                gameId
                newGame {
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
          }
        GQL
      end
    end
  end
end