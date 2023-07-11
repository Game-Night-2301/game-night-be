# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Types::QueryType, vcr: { record: :new_episodes } do
  describe 'display events' do
    it 'can query a single event' do
      Event.destroy_all
      user = create(:user, id: 1)
      event = create(:event, id: 1, host_id: user.id, date: '2020-04-04T00:00:00Z', address: "488 S High St", city: "columbus", state: "ohio", zip: "43215")

      result = GameNightBeSchema.execute(query).as_json

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
      expect(result['data']['event']['playerCount']).to eq(0)
      expect(result['data']['event']['attendees']).to eq([])
    end

    it 'returns an error if event does not exist' do
      result = GameNightBeSchema.execute(query_no_event).as_json

      expect(result['errors'][0]['message']).to eq('Event does not exist.')
    end
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
