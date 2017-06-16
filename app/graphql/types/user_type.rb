Types::UserType = GraphQL::ObjectType.define do
  name 'User'

  field :first_name, types.String
  field :lastName, types.String
  field :name, types.String
end
