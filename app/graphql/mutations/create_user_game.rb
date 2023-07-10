# frozen_string_literal: true

# This is the mutation for creating a user game
module Mutations
  # This is the mutation for creating a user game
  class CreateUserGame < BaseMutation
    field :user_game, Types::UserGameType, null: false
    field :errors, [String], null: false

    argument :userId, Integer, required: true
    argument :gameId, Integer, required: true

    def resolve(userId:, gameId:)
      user_game = UserGame.new(
        user_id: userId,
        game_id: gameId
      )

      if user_game.save
        { user_game:, errors: [] }
      else
        { user_game: nil, errors: user_game.errors.full_messages }
      end
    end
  end
end