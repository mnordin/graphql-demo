Types::UserType = GraphQL::ObjectType.define do
  name 'User'
  description 'A user'

  backed_by_model :user do
    attr :id
    attr :first_name
    attr :last_name
    attr :created_at
    attr :updated_at

    has_many_array :posts, type: Types::PostType
  end

  field :name, types.String
end
