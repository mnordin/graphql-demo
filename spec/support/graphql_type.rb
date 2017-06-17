module GraphqlTypeHelper
  def types
    GraphQL::Define::TypeDefiner.instance
  end
end

RSpec.configure do |config|
  config.include GraphqlTypeHelper, type: :graphql_type
end
