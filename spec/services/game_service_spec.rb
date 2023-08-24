# require 'rails_helper'

# RSpec.describe GameService, vcr: { record: :new_episodes } do
#   before do
#     @game_service = GameService.new
#   end

#   describe "creation" do
#     it "exists" do
#       expect(@game_service).to be_a(GameService)
#     end
#   end

#   describe "instance methods" do
#     it "#all_games" do
#       all_games = @game_service.all_games
#       example = all_games[rand(1100)]

#       expect(all_games).to be_a(Array)
#       expect(all_games.count).to eq(1100)

#       expect(example).to be_a(Hash)
#       expect(example[:id]).to be_a(String)
#       expect(example[:name]).to be_a(String)
#       expect(example[:min_players]).to be_a(Integer)
#       expect(example[:max_players]).to be_a(Integer)
#       expect(example[:min_playtime]).to be_a(Integer)
#       expect(example[:max_playtime]).to be_a(Integer)
#       expect(example[:description]).to be_a(String)
#       expect(example[:image_url]).to be_a(String)
#       expect(example[:average_user_rating]).to be_a(Float).or be_a(Integer)
#       expect(example[:average_strategy_complexity]).to be_a(Float).or be_a(Integer)

#       expect(all_games[0][:name]).to_not eq(all_games[100][:name])
#     end

#     it "get_one_random_game" do
#       game = @game_service.one_random_game

#       expect(game).to be_a(Hash)
#       expect(game[:id]).to be_a(String)
#       expect(game[:name]).to be_a(String)
#       expect(game[:min_players]).to be_a(Integer)
#       expect(game[:max_players]).to be_a(Integer)
#       expect(game[:min_playtime]).to be_a(Integer)
#       expect(game[:max_playtime]).to be_a(Integer)
#       expect(game[:description]).to be_a(String)
#       expect(game[:image_url]).to be_a(String)
#       expect(game[:average_user_rating]).to be_a(Float).or be_a(Integer)
#       expect(game[:average_strategy_complexity]).to be_a(Float).or be_a(Integer)
#     end
#   end
# end
