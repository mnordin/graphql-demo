Types::TextType = GraphQL::ScalarType.define do
  name 'TEXT'
  coerce_input ->(x, _context) { x }
  coerce_result ->(x, _context) { x }
end

Types::DateTimeType = GraphQL::ScalarType.define do
  name 'DATETIME'
  coerce_input ->(x, _context) { x }
  coerce_result ->(x, _context) { x.to_s(:api) }
end

GraphQL::Models::DatabaseTypes.register(:datetime, -> { Types::DateTimeType })
GraphQL::Models::DatabaseTypes.register(:text, -> { Types::TextType })

# Use namespaced Types::ModelNameType by default for association types
GraphQL::Models.model_to_graphql_type = -> (model_class) {
  "Types::#{model_class.name}Type".safe_constantize
}
