module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :users, [UserType], null: false, description: "List all users"
    def users
      User.all
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
