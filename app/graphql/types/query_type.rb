Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  field :user do
    type Types::UserType
    argument :id, !types.ID
    description "Find a User by id"
    resolve ->(obj, args, ctx) { User.find(args["id"]) }
  end

  field :post do
    type Types::PostType
    argument :id, !types.ID
    description "Find a Post by id"
    resolve ->(obj, args, ctx) { Post.find(args["id"]) }
  end

  field :comment do
    type Types::CommentType
    argument :id, !types.ID
    description "Find a Comment by id"
    resolve ->(obj, args, ctx) { Comment.find(args["id"]) }
  end
end
