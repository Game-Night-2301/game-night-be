# frozen_string_literal: true

require 'rails_helper'

module Mutations
  module Events
    RSpec.describe CreateUserEvent, type: :request do
      before(:each) do
        @user_1 = create(:user, id: 1)
        @user_2 = create(:user, id: 2)
        @user_3 = create(:user, id: 3)
        @user_4 = create(:user, id: 4)

        @event = create(:event, id: 1, host_id: 1)

        UserEvent.create(user_id: @user_1.id, event_id: @event.id)
        UserEvent.create(user_id: @user_2.id, event_id: @event.id)
      end

      describe 'resolve' do
        it 'can create a user_event' do
          expect(@event.users.count).to eq(2)

          post '/graphql', params: { query: }

          expect(@event.users.count).to eq(3)
          expect(@event.users).to_not include(@user_3)
          expect(@event.users).to include(@user_4)
        end

        it 'returns an error when the user is already attending the event' do
          UserEvent.create(user_id: @user_4.id, event_id: @event.id)
          post '/graphql', params: { query: }

          response = JSON.parse(@response.body, symbolize_names: true)

          expect(response[:errors][0][:message]).to eq('Cannot return null for non-nullable field CreateUserEventPayload.userEvent')
        end
      end

      def query
        <<~GQL
          mutation {
           createUserEvent(input: {
              userId: 4
              eventId: 1
            }) {
              userEvent {
                id
                userId
                eventId
                }
              }
            }
        GQL
      end
    end
  end
end
