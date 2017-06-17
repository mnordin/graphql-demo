Types::PostType = GraphQL::ObjectType.define do
  name 'Post'
  description 'A post written by a user'

  backed_by_model :post do
    attr :id
    attr :title
    attr :content
    attr :draft
    attr :published_at
    attr :created_at
    attr :updated_at

    has_one :user
    has_many_array :comments
  end
end
