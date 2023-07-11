# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Types::QueryType, vcr: { record: :new_episodes } do
  describe 'display all events' do
    it 'can query all events' do
      Event.destroy_all
      user = create(:user, id: 1, city: "montpelier", state: "vermont")
      event_1 = create(:event, host_id: user.id, address: "304 W 34th St", city: "new york", state: "new york", zip: "10001")
      UserEvent.create(user_id: user.id, event_id: event_1.id)
      create_list(:event, 3)
      event_2 = create(:event, host_id: user.id, address: "100 E Camelback Rd", city: "phoenix", state: "arizona", zip: "85012")

      result = GameNightBeSchema.execute(query).as_json

      expect(result['data']['events']).to be_an(Array)
      expect(result['data']['events'].count).to eq(5)

      expect(result['data']['events'][0]['id']).to eq(event_1.id.to_s)
      expect(result['data']['events'][0]['address']).to eq(event_1.address)
      expect(result['data']['events'][0]['city']).to eq(event_1.city)
      expect(result['data']['events'][0]['state']).to eq(event_1.state)
      expect(result['data']['events'][0]['zip']).to eq(event_1.zip)
      expect(result['data']['events'][0]['title']).to eq(event_1.title)
      expect(result['data']['events'][0]['cancelled']).to eq(event_1.cancelled)
      expect(result['data']['events'][0]['description']).to eq(event_1.description)
      expect(result['data']['events'][0]['hostId']).to eq(event_1.host_id)
      expect(result['data']['events'][0]['game']).to eq(event_1.game)
      expect(result['data']['events'][0]['gameType']).to eq(event_1.game_type)
      expect(result['data']['events'][0]['playerCount']).to eq(1)
      expect(result['data']['events'][0]['attendees'][0]['id']).to eq(user.id.to_s)
      expect(result['data']['events'][0]['attendees'][0]['username']).to eq(user.username)

      expect(result['data']['events'][4]['id']).to eq(event_2.id.to_s)
      expect(result['data']['events'][4]['address']).to eq(event_2.address)
      expect(result['data']['events'][4]['city']).to eq(event_2.city)
      expect(result['data']['events'][4]['state']).to eq(event_2.state)
      expect(result['data']['events'][4]['zip']).to eq(event_2.zip)
      expect(result['data']['events'][4]['title']).to eq(event_2.title)
      expect(result['data']['events'][4]['cancelled']).to eq(event_2.cancelled)
      expect(result['data']['events'][4]['description']).to eq(event_2.description)
      expect(result['data']['events'][4]['hostId']).to eq(event_2.host_id)
      expect(result['data']['events'][4]['game']).to eq(event_2.game)
      expect(result['data']['events'][4]['gameType']).to eq(event_2.game_type)
      expect(result['data']['events'][4]['playerCount']).to eq(0)
      expect(result['data']['events'][4]['attendees']).to eq([])
    end
  end

  def query
    <<~GQL
      query {
        events {
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
