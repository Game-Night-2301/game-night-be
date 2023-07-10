# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_event, mutation: Mutations::CreateEvent
    field :create_user_event, mutation: Mutations::CreateUserEvent
    field :cancel_event, mutation: Mutations::CancelEvent
  end
end
