# frozen_string_literal: true

require 'rails_helper'

module Mutations
  module UserEvents
    RSpec.describe DeleteUserEvent, type: :request, vcr: { record: :new_episodes } do
      describe 'resolve' do
        it 'can destroy a user_event' do
          user_1 = create(:user, id: 1)
          user_2 = create(:user, id: 2)
          event = create(:event, id: 1)

          UserEvent.create(user_id: user_1.id, event_id: event.id)
          UserEvent.create(user_id: user_2.id, event_id: event.id)

          expect(UserEvent.count).to eq(2)
          expect(event.users).to eq([user_1, user_2])

          result = GameNightBeSchema.execute(query).as_json

          expect(UserEvent.count).to eq(1)

          expect(result['data']['deleteUserEvent']['event']['attendees'][0]['id']).to eq(user_2.id.to_s)
          expect(result['data']['deleteUserEvent']['event']['attendees'][0]['username']).to eq(user_2.username)
        end

        it 'returns an error when the user is not attending the event' do
          result = GameNightBeSchema.execute(query).as_json

          expect(result['data']['deleteUserEvent']).to eq(nil)
          expect(result['errors'][0]['message']).to eq('UserEvent not found.')
        end
      end

      def query
        <<~GQL
            mutation {
              deleteUserEvent(input: {
                  userId: 1
                  eventId: 1
              }) {
              event {
                  attendees {
                  id
                  username
                  }
              }
          } }
        GQL
      end
    end
  end
end