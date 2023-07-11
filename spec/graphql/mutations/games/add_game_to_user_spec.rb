# frozen_string_literal: true

require 'rails_helper'
# This is the add game to user spec file
module Mutations
  # This is the games module for testing
  module Games
    RSpec.describe CreateUserGame, type: :request, vcr: { record: :new_episodes } do
      describe 'resolve' do
        it 'can create a user game' do
          user = create(:user, id: 1, city: "montpelier", state: "vermont")
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
          expect(response[:data][:createUserGame][:userGame][:gameId]).to eq(game_3.id)
          expect(response[:data][:createUserGame][:userGame]).to have_key(:newGame)
          expect(response[:data][:createUserGame][:userGame][:newGame]).to be_a(Hash)
          expect(response[:data][:createUserGame][:userGame][:newGame]).to have_key(:name)
          expect(response[:data][:createUserGame][:userGame][:newGame][:name]).to be_a(String)
          expect(response[:data][:createUserGame][:userGame][:newGame][:name]).to eq(game_3.name)

          expect(response[:data][:createUserGame][:userGame][:newGame]).to have_key(:minPlayers)
          expect(response[:data][:createUserGame][:userGame][:newGame][:minPlayers]).to be_an(Integer)
          expect(response[:data][:createUserGame][:userGame][:newGame][:minPlayers]).to eq(game_3.min_players)

          expect(response[:data][:createUserGame][:userGame][:newGame]).to have_key(:maxPlayers)
          expect(response[:data][:createUserGame][:userGame][:newGame][:maxPlayers]).to be_an(Integer)
          expect(response[:data][:createUserGame][:userGame][:newGame][:maxPlayers]).to eq(game_3.max_players)

          expect(response[:data][:createUserGame][:userGame][:newGame]).to have_key(:minPlaytime)
          expect(response[:data][:createUserGame][:userGame][:newGame][:minPlaytime]).to be_an(Integer)
          expect(response[:data][:createUserGame][:userGame][:newGame][:minPlaytime]).to eq(game_3.min_playtime)

          expect(response[:data][:createUserGame][:userGame][:newGame]).to have_key(:maxPlaytime)
          expect(response[:data][:createUserGame][:userGame][:newGame][:maxPlaytime]).to be_an(Integer)
          expect(response[:data][:createUserGame][:userGame][:newGame][:maxPlaytime]).to eq(game_3.max_playtime)

          expect(response[:data][:createUserGame][:userGame][:newGame]).to have_key(:description)
          expect(response[:data][:createUserGame][:userGame][:newGame][:description]).to be_a(String)
          expect(response[:data][:createUserGame][:userGame][:newGame][:description]).to eq(game_3.description)

          expect(response[:data][:createUserGame][:userGame][:newGame]).to have_key(:imageUrl)
          expect(response[:data][:createUserGame][:userGame][:newGame][:imageUrl]).to be_a(String)
          expect(response[:data][:createUserGame][:userGame][:newGame][:imageUrl]).to eq(game_3.image_url)

          expect(response[:data][:createUserGame][:userGame][:newGame]).to have_key(:averageUserRating)
          expect(response[:data][:createUserGame][:userGame][:newGame][:averageUserRating]).to be_a(Float)
          expect(response[:data][:createUserGame][:userGame][:newGame][:averageUserRating]).to eq(game_3.average_user_rating)

          expect(response[:data][:createUserGame][:userGame][:newGame]).to have_key(:averageStrategyComplexity)
          expect(response[:data][:createUserGame][:userGame][:newGame][:averageStrategyComplexity]).to be_a(Float)
          expect(response[:data][:createUserGame][:userGame][:newGame][:averageStrategyComplexity]).to eq(game_3.average_strategy_complexity)
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
