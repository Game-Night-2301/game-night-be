# frozen_string_literal: true

# This is the mutation for creating an event
module Mutations
  # This is the mutation for creating an event
  class CreateEvent < BaseMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false
    field :event, Types::EventType, null: false
    field :errors, [String], null: false

    argument :date, String, required: true
    argument :address, String, required: true
    argument :city, String, required: true
    argument :state, String, required: true
    argument :zip, Integer, required: true
    argument :title, String, required: true
    argument :description, String, required: true
    argument :host, Integer, required: true
    argument :game, Integer, required: true
    argument :gameType, String, required: true

    def resolve(date:, address:, city:, state:, zip:, title:, description:, host:, game:, gameType:)
      event = Event.new(
        date:,
        address:,
        city:,
        state:,
        zip:,
        title:,
        description:,
        host_id: host.to_i,
        game: game.to_i,
        game_type: gameType
      )

      if event.save
        { event:, errors: [] }
      else
        { event: nil, errors: event.errors.full_messages }
      end
    end
  end
end
