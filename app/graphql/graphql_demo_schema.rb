GraphqlDemoSchema = GraphQL::Schema.define do
  query(Types::QueryType)

  mutation(Mutations::MutationType)

  # Set up the graphql-batch gem
  lazy_resolve(Promise, :sync)
  instrument(:query, GraphQL::Batch::Setup)
end
