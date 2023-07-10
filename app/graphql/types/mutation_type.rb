# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_event, mutation: Mutations::CreateEvent
    field :create_user_event, mutation: Mutations::CreateUserEvent
    field :create_user_game, mutation: Mutations::CreateUserGame
    # TODO: remove me
    field :test_field, String, null: false,
                               description: 'An example field added by the generator'
    def test_field
      'Hello World'
    end
  end
end
