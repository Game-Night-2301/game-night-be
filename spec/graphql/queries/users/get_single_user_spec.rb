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

    it 'returns events sorted by distance' do
      Event.destroy_all
      create(:user, id: 1000, city: "Boulder", state: "Colorado")
      event_1 = create(:event, title: "chipotle", address: "1100 Ken Pratt Blvd", city: "Longmont", state: "Colorado", zip: "80501")
      event_2 = create(:event, title: "chipotle", address: "375 McCaslin Blvd D", city: "Louisville", state: "Colorado", zip: "80027")
      event_3 = create(:event, title: "chipotle", address: "1650 28th St", city: "Boulder", state: "Colorado", zip: "80301")
      event_4 = create(:event, title: "chipotle", address: "1940 Coalton Rd", city: "Superior", state: "Colorado", zip: "80027")
      event_5 = create(:event, title: "chipotle", address: "548 W South Boulder Rd", city: "Lafayette", state: "Colorado", zip: "80026")

      result = GameNightBeSchema.execute(sorted_events_query).as_json

      expect(result["data"]["user"]["sortedEvents"][0]["id"]).to eq(event_3.id.to_s)
      expect(result["data"]["user"]["sortedEvents"][1]["id"]).to eq(event_2.id.to_s)
      expect(result["data"]["user"]["sortedEvents"][2]["id"]).to eq(event_4.id.to_s)
      expect(result["data"]["user"]["sortedEvents"][3]["id"]).to eq(event_5.id.to_s)
      expect(result["data"]["user"]["sortedEvents"][4]["id"]).to eq(event_1.id.to_s)
    end
  end

  def sorted_events_query
    <<~GQL
        query {
        user(id: 1000 ) {
          sortedEvents {
            id
            date
            address
            city
            state
            zip
            title
            cancelled
            description
            host {
              id
              username
            }
            game
            gameType
            attendees {
              id
              username
            }
            playerCount
          }
        }
      }
    GQL
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
