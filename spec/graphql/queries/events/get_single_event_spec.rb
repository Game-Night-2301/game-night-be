# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Types::QueryType, vcr: { record: :new_episodes } do
  describe 'display events' do
    it 'can query a single event' do
      Event.destroy_all
      host = create(:user, id: 2, city: "montpelier", state: "vermont")
      user = create(:user, id: 1, city: "austin", state: "texas")

      event = create(:event, id: 1, host_id: host.id, game: 35, address: "488 S High St", city: "columbus", state: "ohio", zip: "43215")
      game = create(:game, id: 35)
      UserEvent.create(user_id: user.id, event_id: event.id)
      UserEvent.create(user_id: host.id, event_id: event.id)
      UserGame.create(user_id: host.id, game_id: 35)

      result = GameNightBeSchema.execute(query).as_json
      # Event Details
      expect(result['data']['event']['id']).to eq(event.id.to_s)
      expect(result['data']['event']['address']).to eq(event.address)
      expect(result['data']['event']['city']).to eq(event.city)
      expect(result['data']['event']['state']).to eq(event.state)
      expect(result['data']['event']['zip']).to eq(event.zip)
      expect(result['data']['event']['title']).to eq(event.title)
      expect(result['data']['event']['cancelled']).to eq(event.cancelled)
      expect(result['data']['event']['description']).to eq(event.description)
      expect(result['data']['event']['hostId']).to eq(event.host_id)
      expect(result['data']['event']['game']).to eq(event.game)
      expect(result['data']['event']['gameType']).to eq(event.game_type)
      expect(result['data']['event']['playerCount']).to eq(2)
      # Game Details
      expect(result['data']['event']['gameDetails']['id']).to eq(game.id.to_s)
      expect(result['data']['event']['gameDetails']['name']).to eq(game.name)
      expect(result['data']['event']['gameDetails']['minPlayers']).to eq(game.min_players)
      expect(result['data']['event']['gameDetails']['maxPlayers']).to eq(game.max_players)
      expect(result['data']['event']['gameDetails']['minPlaytime']).to eq(game.min_playtime)
      expect(result['data']['event']['gameDetails']['maxPlaytime']).to eq(game.max_playtime)
      expect(result['data']['event']['gameDetails']['description']).to eq(game.description)
      expect(result['data']['event']['gameDetails']['imageUrl']).to eq(game.image_url)
      expect(result['data']['event']['gameDetails']['averageUserRating']).to eq(game.average_user_rating)
      expect(result['data']['event']['gameDetails']['averageStrategyComplexity']).to eq(game.average_strategy_complexity)
      # Host Details
      expect(result['data']['event']['host']['id']).to eq(host.id.to_s)
      expect(result['data']['event']['host']['username']).to eq(host.username)
      # Attendee Details
      expect(result['data']['event']['attendees'].count).to eq(2)
      expect(result['data']['event']['attendees'][0]['id']).to eq(host.id.to_s)
      expect(result['data']['event']['attendees'][0]['username']).to eq(host.username)
      expect(result['data']['event']['attendees'][1]['id']).to eq(user.id.to_s)
      expect(result['data']['event']['attendees'][1]['username']).to eq(user.username)
    end

    it 'returns an error if event does not exist' do
      result = GameNightBeSchema.execute(query_no_event).as_json

      expect(result['errors'][0]['message']).to eq('Event does not exist.')
    end

    it "shows whether game is currently full" do
      Event.destroy_all
      user_1 = create(:user, city: "Denver", state: "Colorado")
      user_2 = create(:user, city: "Denver", state: "Colorado")
      user_3 = create(:user, city: "Denver", state: "Colorado")
      user_4 = create(:user, city: "Denver", state: "Colorado")
      game = create(:game, max_players: 4)
      event = create(:event, id: 1, game: game.id, address: "1000 36th street", city: "Boulder", state: "Colorado", zip: 80_302)
      user_1.user_events.create(event_id: event.id)
      user_2.user_events.create(event_id: event.id)
      user_3.user_events.create(event_id: event.id)

      result = GameNightBeSchema.execute(full_query).as_json
      expect(result["data"]["event"]["full"]).to eq(false)

      user_4.user_events.create(event_id: event.id)
      result = GameNightBeSchema.execute(full_query).as_json
      expect(result["data"]["event"]["full"]).to eq(true)
    end
  end

  def full_query
    <<~GQL
      query {
        event(id: 1) {
          full
        }
      }
    GQL
  end

  def query
    <<~GQL
      query {
        event(id: 1) {
          id
          date
          address
          state
          city
          zip
          title
          cancelled
          description
          hostId
          game
          gameType
          playerCount
          gameDetails {
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
          host {
            id
            username
          }
          attendees {
            id
            username
          }
        }
      }
    GQL
  end

  def query_no_event
    <<~GQL
      query {
        event(id: 1) {
          id
          date
          address
          state
          city
          zip
          title
          cancelled
          description
          hostId
          game
          gameType
          playerCount
          attendees {
            id
            username
          }
        }
      }
    GQL
  end
end
