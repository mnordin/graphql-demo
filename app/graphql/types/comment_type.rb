Types::CommentType = GraphQL::ObjectType.define do
  name 'Comment'
  description 'A comment written by a user on a post'

  backed_by_model :comment do
    attr :id
    attr :content
    attr :created_at
    attr :updated_at

    has_one :user
    has_one :post
  end
end
