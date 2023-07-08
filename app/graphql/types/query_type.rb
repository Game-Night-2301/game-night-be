module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end

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
