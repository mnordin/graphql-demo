GraphqlDemoSchema = GraphQL::Schema.define do
  query(Types::QueryType)

  # Set up the graphql-batch gem
  lazy_resolve(Promise, :sync)
  instrument(:query, GraphQL::Batch::Setup)
end
