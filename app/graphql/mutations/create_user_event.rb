# frozen_string_literal: true

# This is the mutation for creating an event
module Mutations
  # This is the mutation for creating an event
  class CreateUserEvent < BaseMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false
    field :user_event, Types::UserEventType, null: false
    field :errors, [String], null: false

    argument :userId, Integer, required: true
    argument :eventId, Integer, required: true

    def resolve(eventId:, userId:)
      user_event = UserEvent.new(
        event_id: eventId,
        user_id: userId
      )

      if user_event.save
        { user_event:, errors: [] }
      else
        { user_event: nil, errors: user_event.errors.full_messages }
      end
    end
  end
end