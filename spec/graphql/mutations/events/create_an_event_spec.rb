# frozen_string_literal: true

require 'rails_helper'

module Mutations
  module Events
    RSpec.describe CreateEvent, type: :request, vcr: { record: :new_episodes } do
      describe 'resolve' do
        it 'can create an event' do
          host = create(:user, id: 4_744_564)
          post '/graphql', params: { query: }

          result = JSON.parse(response.body)
          event = Event.last

          expect(event.users).to eq([host])
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
          expect(result['data']['createEvent']['event']['startTime']).to eq(event.start_time)
          expect(result['data']['createEvent']['event']['endTime']).to eq(event.end_time)
        end

        it 'returns an error if missing a required field' do
          post '/graphql', params: { query: query_missing_required_field }

          result = JSON.parse(response.body)

          expect(result['errors'][0]['message']).to eq("Argument 'city' on InputObject 'CreateEventInput' is required. Expected type String!")
          expect(result['errors'][1]['message']).to eq("Argument 'zip' on InputObject 'CreateEventInput' is required. Expected type Int!")
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
              gameType: "board game",
              startTime: "12:00",
              endTime: "15:00"
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
                startTime
                endTime
              }
            }
          }
        GQL
      end

      def query_missing_required_field
        <<~GQL
          mutation {
            createEvent(input: {
              date: "2023/11/7",
              address: "123 This street",
              state: "Colorado",
              title: "Grandma's basement",
              description: "We'll be playing caracasonne for 9 hours",
              host: 4744564,
              game: 97833646,
              gameType: "board game",
              startTime: "12:00",
              endTime: "15:00"

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
                startTime
                endTime
              }
            }
          }
        GQL
      end
    end
  end
end
