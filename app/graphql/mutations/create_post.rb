Mutations::CreatePost = GraphQL::Relay::Mutation.define do
  name 'CreatePost'

  mutator_definition = GraphQL::Models.define_mutator(
    self,
    Post,
    null_behavior: :set_null
  ) do
    attr :title
    attr :content
  end

  return_field :post, Types::PostType

  resolve -> (_object, inputs, context) {
    model = Post.new(user: User.first)
    mutator = mutator_definition.mutator(model, inputs, context)

    mutator.apply_changes
    mutator.validate!
    mutator.save!

    { post: model }
  }
end
