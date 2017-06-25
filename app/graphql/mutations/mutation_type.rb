Mutations::MutationType = GraphQL::ObjectType.define do
  name 'Mutations'

  field :createPost, field: Mutations::CreatePost.field
  field :createUser, field: Mutations::CreateUser.field
end
