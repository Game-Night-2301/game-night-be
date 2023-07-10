# frozen_string_literal: true

# This is the mutation for cancelling an event
module Mutations
  # This is the mutation for cancelling an event
  class CancelEvent < BaseMutation
    field :event, Types::EventType, null: false

    argument :hostId, Integer, required: true
    argument :id, [Integer], required: true
    argument :cancelled, [Boolean], required: true

    def resolve(id:, cancelled:, hostId:)
      event = Event.find_by_id(id)
      raise GraphQL::ExecutionError, "Event not found or user id does not match event host id." unless event && event.host_id == hostId

      event.update(cancelled: cancelled)
      { event: event }
    end
  end
end
