Mutations::MutationType = GraphQL::ObjectType.define do
  name 'Mutations'

  field :createPost, field: Mutations::CreatePost.field
end
