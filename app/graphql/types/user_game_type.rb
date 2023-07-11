# frozen_string_literal: true

# This is the user game type
module Types
  # This is the user game type
  class UserGameType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer, null: false
    field :game_id, Integer, null: false
    field :new_game, Types::GameType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def new_game
      object.game
    end
  end
end
