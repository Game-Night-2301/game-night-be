require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'display events' do
    it 'can query a single event' do
      Event.destroy_all
      user = create(:user, id: 1)
      event = create(:event, id: 1, host_id: user.id, date: '2020-04-04T00:00:00Z')

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
end