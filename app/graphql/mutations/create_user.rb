Mutations::CreateUser = GraphQL::Relay::Mutation.define do
  name 'CreateUser'

  mutator_definition = GraphQL::Models.define_mutator(
    self,
    User,
    null_behavior: :set_null
  ) do
    attr :first_name
    attr :last_name
  end

  return_field :user, Types::UserType

  resolve -> (_object, inputs, context) {
    model = User.new
    mutator = mutator_definition.mutator(model, inputs, context)

    mutator.apply_changes
    mutator.validate!
    mutator.authorize!
    mutator.save!

    { user: model }
  }
end
