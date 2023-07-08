# frozen_string_literal: true

module Types
  class EventType < Types::BaseObject
    field :id, ID, null: false
    field :date, GraphQL::Types::ISO8601DateTime
    field :address, String
    field :city, String
    field :state, String
    field :zip, Integer
    field :title, String
    field :cancelled, Boolean
    field :description, String
    field :host_id, Integer
    field :game, Integer
    field :game_type, String
    field :lat, Float
    field :lon, Float
    field :attendees, [Types::UserType]
    field :player_count, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def attendees
      object.users
    end

    def player_count
      object.users.count
    end
  end
end
