require 'rails_helper'

module Mutations
  module Events

    RSpec.describe CreateEvent, type: :request do
      describe 'resolve' do
        it 'can create an event' do
          post '/graphql', params: { query: query }
      
          result = JSON.parse(response.body)
          event = Event.last

          expect(result['data']['createEvent']['event']['id']).to eq(event.id.to_s)
          expect(result['data']['createEvent']['event']['address']).to eq(event.address)
          expect(result['data']['createEvent']['event']['state']).to eq(event.state)
          expect(result['data']['createEvent']['event']['city']).to eq(event.city)
          expect(result['data']['createEvent']['event']['zip']).to eq(event.zip)
          expect(result['data']['createEvent']['event']['title']).to eq(event.title)
          expect(result['data']['createEvent']['event']['description']).to eq(event.description)
          expect(result['data']['createEvent']['event']['hostId']).to eq(event.host_id)
          expect(result['data']['createEvent']['event']['game']).to eq(event.game)
          expect(result['data']['createEvent']['event']['gameType']).to eq(event.game_type)
        end
      end
    
      def query
        <<~GQL
        mutation {
          createEvent(input: {
            date: "2023/11/7",
            address: "123 This street",
            state: "Colorado",
            city: "Denver",
            zip: 15555,
            title: "Grandma's basement",
            description: "We'll be playing caracasonne for 9 hours",
            host: 4744564,
            game: 97833646,
            gameType: "board game"
          }) {
            event {
              id
              date
              address
              state
              city
              zip
              title
              description
              hostId
              game
              gameType
            }
          }
        }
        GQL
      end
    end
  end
end