# frozen_string_literal: true

# This is the user event type
module Types
  # This is the user event type
  class UserEventType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer, null: false
    field :event_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
