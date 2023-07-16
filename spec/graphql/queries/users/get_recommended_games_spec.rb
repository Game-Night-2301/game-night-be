require 'rails_helper'

RSpec.describe Types::QueryType, vcr: { record: :new_episodes } do
  describe 'ai recommendations' do
    it 'can return a list of recommended games' do
      user = create(:user, id: 1, city: "Denver", state: "Colorado")

      game_1 = create(:game, name: "Catan")
      game_2 = create(:game, name: "Stone Age")
      game_3 = create(:game, name: "Irish Gauge")
      game_4 = create(:game, name: "Elder Sign")
      game_5 = create(:game, name: "Ca$h 'n Gun$")

      create(:game, name: "Ticket to Ride")
      create(:game, name: "Pandemic")
      create(:game, name: "Carcassonne")

      UserGame.create(user_id: user.id, game_id: game_1.id)
      UserGame.create(user_id: user.id, game_id: game_2.id)
      UserGame.create(user_id: user.id, game_id: game_3.id)
      UserGame.create(user_id: user.id, game_id: game_4.id)
      UserGame.create(user_id: user.id, game_id: game_5.id)

      result = GameNightBeSchema.execute(recommended_games_query).as_json

      expect(result["data"]["user"]["recommendedGames"]).to be_an(Array)
      expect(result["data"]["user"]["recommendedGames"]).to all(be_a(Hash))
      expect(result["data"]["user"]["recommendedGames"].length).to eq(3)
    end
  end

  describe "sad paths" do
    it "recommended games not in database" do
      user = create(:user, id: 1, city: "Denver", state: "Colorado")

      game_1 = create(:game, name: "Catan")
      game_2 = create(:game, name: "Stone Age")
      game_3 = create(:game, name: "Irish Gauge")
      game_4 = create(:game, name: "Elder Sign")
      game_5 = create(:game, name: "Ca$h 'n Gun$")

      UserGame.create(user_id: user.id, game_id: game_1.id)
      UserGame.create(user_id: user.id, game_id: game_2.id)
      UserGame.create(user_id: user.id, game_id: game_3.id)
      UserGame.create(user_id: user.id, game_id: game_4.id)
      UserGame.create(user_id: user.id, game_id: game_5.id)

      result = GameNightBeSchema.execute(recommended_games_query).as_json

      expect(result["data"]["user"]["recommendedGames"]).to be_an(Array)
      expect(result["data"]["user"]["recommendedGames"]).to all(be_a(Hash))
      expect(result["data"]["user"]["recommendedGames"].length).to eq(3)
    end
  end

  def recommended_games_query
    <<~GQL
        query {
        user(id: 1 ) {
          id
          username
          password
          city
          state
          lat
          lon
          attendingEvents {
            id
          }
          hostedEvents {
            id
          }
          recommendedGames {
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
      }
    GQL
  end
end
