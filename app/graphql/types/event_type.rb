# frozen_string_literal: true

# This is the event type
module Types
  # This is the event type
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
    field :host, Types::UserType
    field :game, Integer
    field :game_type, String
    field :lat, Float
    field :lon, Float
    field :attendees, [Types::UserType]
    field :player_count, Integer
    field :game_details, Types::GameType
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :start_time, String
    field :end_time, String
    field :distance_from, Float, null: true
    field :full, Boolean, null: false

    def attendees
      return object.users if object.instance_of?(Event)

      Event.find(object["id"].to_i).users
    end

    def host
      return object.find_host(object.host_id) if object.instance_of?(Event)

      Event.find(object["id"].to_i).find_host(object["host_id"])
    end

    def player_count
      return object.player_count if object.instance_of?(Event)

      Event.find(object["id"].to_i).player_count
    end

    def game_details
      Game.find_by_id(object.game)
    end

    def distance_from
      object["distance_from"]
    end

    def full
      player_count >= Game.find(object.game).max_players
    end
  end
end
