GraphqlDemoSchema = GraphQL::Schema.define do
  query(Types::QueryType)

  TextType = GraphQL::ScalarType.define do
    name 'TEXT'
    coerce_input ->(x, _context) { x }
    coerce_result ->(x, _context) { x }
  end

  DateTimeType = GraphQL::ScalarType.define do
    name 'DATETIME'
    coerce_input ->(x, _context) { x }
    coerce_result ->(x, _context) { x.to_s(:api) }
  end

  GraphQL::Models::DatabaseTypes.register(:datetime, -> { DateTimeType })
  GraphQL::Models::DatabaseTypes.register(:text, -> { TextType })

  # Set up the graphql-batch gem
  lazy_resolve(Promise, :sync)
  instrument(:query, GraphQL::Batch::Setup)
end
