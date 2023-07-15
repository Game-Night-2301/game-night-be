# frozen_string_literal: true

# This is the user type
module Types
  # This is the user type
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :username, String
    field :password, String
    field :city, String
    field :state, String
    field :lat, Float
    field :lon, Float
    field :sorted_events, [Types::EventType]
    field :owned_games, [Types::GameType]
    field :attending_events, [Types::EventType]
    field :hosted_events, [Types::EventType]
    field :recommended_games, [Types::GameType]
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def attending_events
      object.events
    end

    def hosted_events
      object.hosted_events
    end

    def owned_games
      object.games
    end

    def sorted_events
      object.sort_events_by_distance
    end

    def recommended_games
      object.recommended_games.flatten
    end
  end
end
