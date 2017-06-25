Rails.application.routes.draw do
  mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"

  post "/graphql", to: "graphql#execute"

  resource :session, only: [:create, :destroy]

  root to: 'home#show'
end
