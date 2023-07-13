# frozen_string_literal: true

# This is the mutation for destroying an event
module Mutations
  # This is the mutation for destroying an event
  class DeleteUserEvent < BaseMutation
    field :user_event, Types::UserEventType, null: false
    field :event, Types::EventType, null:false

    argument :user_id, Integer, required: true
    argument :event_id, Integer, required: true

    def resolve(event_id:, user_id:)
      if user_event = UserEvent.find_by(event_id: event_id, user_id: user_id)
        event = user_event.event
        user_event.destroy
        { event: event }
      else
        raise GraphQL::ExecutionError, "UserEvent not found."
      end
    end
  end
end