# frozen_string_literal: true

# This is the mutation for cancelling an event
module Mutations
  # This is the mutation for cancelling an event
  class CancelEvent < BaseMutation
    field :event, Types::EventType, null: false
    field :errors, [String], null: false

    argument :hostId, [Integer], required: true
    argument :id, [Integer], required: true
    argument :cancelled, [Boolean], required: true

    def resolve(id:, cancelled:, hostId:)
      event = Event.find_by_id(id)
      if event && event.host_id == hostId
        event.update(cancelled: cancelled)
        { event: event, errors: [] }
      else
        raise GraphQL::ExecutionError, "Event not found or user is not host"
      end
    end
  end
end