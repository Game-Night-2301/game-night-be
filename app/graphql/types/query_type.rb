# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :users, [UserType], null: false, description: "List all users"
    def users
      User.all
    end

    field :user, Types::UserType, null: false, description: "Find a user by id" do
      argument :id, ID, required: true
    end
    def user(id:)
      User.find(id)
    end

    field :events, [EventType], null: false, description: "List all events"
    def events
      Event.all
    end

    field :event, Types::EventType, null: false, description: "Find an event by id" do
      argument :id, ID, required: true
    end
    def event(id:)
      Event.find(id)
    end
  end
end


# Try this query!!

# {
#   users {
#     id
#     events {
#       id
#       date
#       address
#       city
#       state
#       zip
#       title
#       cancelled
#       description
#       hostId
#       game
#       gameType
#       lat
#       lon
#     }
#   } 
# }
