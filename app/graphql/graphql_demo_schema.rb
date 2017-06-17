GraphqlDemoSchema = GraphQL::Schema.define do
  query(Types::QueryType)
  DateTimeType = GraphQL::ScalarType.define do
    name 'DATETIME'
    coerce_input ->(x, _context) { x }
    coerce_result ->(x, _context) { x.to_s(:api) }
  end

  GraphQL::Models::DatabaseTypes.register(:datetime, -> { DateTimeType })
end
