# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'display user' do
    it 'can query a single user' do
      User.destroy_all
      user = create(:user, id: 1)

      result = GameNightBeSchema.execute(query).as_json

      expect(result['data']['user']['id']).to eq(user.id.to_s)
      expect(result['data']['user']['username']).to eq(user.username)
      expect(result['data']['user']['password']).to eq(user.password)
      expect(result['data']['user']['city']).to eq(user.city)
      expect(result['data']['user']['state']).to eq(user.state)
      expect(result['data']['user']['lat']).to eq(user.lat)
      expect(result['data']['user']['lon']).to eq(user.lon)
      expect(result['data']['user']['attendingEvents']).to be_an(Array)
      expect(result['data']['user']['hostedEvents']).to be_an(Array)
    end

    it 'returns an error is the user does not exist' do
      result = GameNightBeSchema.execute(query_no_user).as_json

      expect(result['errors'][0]['message']).to eq('User does not exist.')
    end
  end

  def query
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
        }
      }
    GQL
  end

  def query_no_user
    <<~GQL
        query {
        user(id: 70 ) {
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
        }
      }
    GQL
  end
end
