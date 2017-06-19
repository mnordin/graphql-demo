Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  field :user, function: Functions::FindRecord.new(
    model: User,
    type: Types::UserType,
  ) do
    argument :id, !types.ID
    description "Find a User by id"
  end

  field :post, function: Functions::FindRecord.new(
    model: Post,
    type: Types::PostType,
  ) do
    argument :id, !types.ID
    description "Find a Post by id"
  end

  field :comment, function: Functions::FindRecord.new(
    model: Comment,
    type: Types::CommentType,
  ) do
    argument :id, !types.ID
    description "Find a Comment by id"
  end
end
