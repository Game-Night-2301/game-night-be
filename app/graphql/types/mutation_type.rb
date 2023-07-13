# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_event, mutation: Mutations::CreateEvent
    field :create_user_event, mutation: Mutations::CreateUserEvent
    field :create_user_game, mutation: Mutations::CreateUserGame
    field :cancel_event, mutation: Mutations::CancelEvent
    field :delete_user_event, mutation: Mutations::DeleteUserEvent
  end
end
