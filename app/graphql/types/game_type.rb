# frozen_string_literal: true

# This is the event type

module Types
  # This is the event type
  class GameType < Types::BaseObject
    field :id, ID, null: false
    field :bga_id, String
    field :name, String
    field :min_players, Integer
    field :max_players, Integer
    field :min_playtime, Integer
    field :max_playtime, Integer
    field :description, String
    field :image_url, String
    field :average_user_rating, Float
    field :average_strategy_complexity, Float
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
