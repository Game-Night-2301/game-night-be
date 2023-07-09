# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'display all users' do
    it 'can query all users' do
      User.destroy_all
      user_1 = create(:user, id: 1)
      create_list(:user, 3)
      user_2 = create(:user, id: 5)

      result = GameNightBeSchema.execute(query).as_json

      expect(result['data']['users']).to be_an(Array)
      expect(result['data']['users'].count).to eq(5)

      expect(result['data']['users'][0]['id']).to eq(user_1.id.to_s)
      expect(result['data']['users'][0]['username']).to eq(user_1.username)
      expect(result['data']['users'][0]['password']).to eq(user_1.password)
      expect(result['data']['users'][0]['city']).to eq(user_1.city)
      expect(result['data']['users'][0]['state']).to eq(user_1.state)
      expect(result['data']['users'][0]['lat']).to eq(user_1.lat)
      expect(result['data']['users'][0]['lon']).to eq(user_1.lon)
      expect(result['data']['users'][0]['attendingEvents']).to be_an(Array)
      expect(result['data']['users'][0]['hostedEvents']).to be_an(Array)

      expect(result['data']['users'][4]['id']).to eq(user_2.id.to_s)
      expect(result['data']['users'][4]['username']).to eq(user_2.username)
      expect(result['data']['users'][4]['password']).to eq(user_2.password)
      expect(result['data']['users'][4]['city']).to eq(user_2.city)
      expect(result['data']['users'][4]['state']).to eq(user_2.state)
      expect(result['data']['users'][4]['lat']).to eq(user_2.lat)
      expect(result['data']['users'][4]['lon']).to eq(user_2.lon)
      expect(result['data']['users'][4]['attendingEvents']).to be_an(Array)
      expect(result['data']['users'][4]['hostedEvents']).to be_an(Array)
    end
  end

  def query
    <<~GQL
        query {
        users {
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
