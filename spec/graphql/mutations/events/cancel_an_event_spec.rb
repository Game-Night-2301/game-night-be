# frozen_string_literal: true

require 'rails_helper'

module Mutations
  module Events
    RSpec.describe CancelEvent, type: :request do
      before do
        @user_1 = create(:user, id: 1)
        @user_2 = create(:user, id: 2)
        @user_3 = create(:user, id: 3)
        @user_4 = create(:user, id: 4)

        @event_1 = create(:event, host_id: @user_1.id, id: 1, cancelled: false)
        @event_2 = create(:event, host_id: @user_1.id, id: 2)
        @event_3 = create(:event, host_id: @user_2.id, id: 3)
        @event_4 = create(:event, host_id: @user_3.id, id: 4)
      end

      describe "resolve" do
        it "updates event cancelled = true" do
          expect(@event_1.cancelled).to eq(false)
          post '/graphql', params: { query: }
          response = JSON.parse(@response.body, symbolize_names: true)
          expect(response[:data][:cancelEvent][:event][:id]).to eq("1")
          @event_1.reload
          expect(@event_1.cancelled).to eq(true)
        end
      end

      describe "event doesn't exist" do
        it "updates event cancelled = true" do
          expect(@event_1.cancelled).to eq(false)
          post '/graphql', params: { query: }
          response = JSON.parse(@response.body, symbolize_names: true)
          expect(response[:data][:cancelEvent][:event][:id]).to eq("1")
          @event_1.reload
          expect(@event_1.cancelled).to eq(false)
        end
      end

      def query
        <<~GQL
          mutation {
            cancelEvent(input: {
              id: 1
              hostId: 1
              cancelled: true
            }) {
                event {
                  id
                  date
                  address
                  city
                  state
                  zip
                  title
                  cancelled
                  description
                  hostId
                  host {
                    id
                    username
                  }
                  game
                  gameType
                  lat
                  lon
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
    end
  end
end