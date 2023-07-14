# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :errors, [String], null: false

    field :users, [UserType], null: false, description: 'List all users'
    def users
      User.all
    end

    field :user, Types::UserType, null: false, description: 'Find a user by id' do
      argument :id, ID, required: true
    end

    def user(id:)
      User.find(id)
    rescue ActiveRecord::RecordNotFound
      raise GraphQL::ExecutionError.new('User does not exist.', extensions: { status_code: 404 })
    end

    field :events, [EventType], null: false, description: 'List all events'
    def events
      Event.all
    end

    field :event, Types::EventType, null: false, description: 'Find an event by id' do
      argument :id, ID, required: true
    end

    def event(id:)
      Event.find(id)
    rescue ActiveRecord::RecordNotFound
      raise GraphQL::ExecutionError.new('Event does not exist.', extensions: { status_code: 404 })
    end

    field :games, [GameType], null: false, description: 'List all games'
    def games
      Game.all
    end

    field :game_search, [GameType], null: false, description: 'Searched games' do
      argument :term, String, required: true
    end

    def game_search(term:)
      results = Game.search_results(term)
      raise GraphQL::ExecutionError.new("I'm sorry, no games in our database match your search!",
         extensions: { status_code: 404 }) if results.empty?
      results
    end
  end
end


