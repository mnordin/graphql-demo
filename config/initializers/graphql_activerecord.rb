# Use namespaced Types::ModelNameType by default for association types
GraphQL::Models.model_to_graphql_type = -> (model_class) {
  "Types::#{model_class.name}Type".safe_constantize
}
