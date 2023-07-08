# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :username, String
    field :password, String
    field :city, String
    field :state, String
    field :lat, Float
    field :lon, Float
    field :attending_events, [Types::EventType]
    field :hosted_events, [Types::EventType]
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def attending_events
      object.events
    end
    
    def hosted_events
      object.events.where(host_id: object.id)
    end
  end
end
