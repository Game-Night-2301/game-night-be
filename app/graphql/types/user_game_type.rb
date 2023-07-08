# frozen_string_literal: true

# This is the user game type
module Types
  # This is the user game type
  class UserGameType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer, null: false
    field :game, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
