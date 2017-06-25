require 'rails_helper'

module Mutations
  describe CreateUser, type: :graphql do
    it { is_expected.to have_an_input_field(:firstName).of_type(!types.String) }
    it { is_expected.to have_an_input_field(:lastName).of_type(!types.String) }

    it { is_expected.to have_a_return_field(:user).of_type(Types::UserType) }

    it 'creates a User' do
      result = GraphQL::Query.new(
        GraphqlDemoSchema,
        CREATE_USER_QUERY,
        context: {},
      ).result

      expect(User.count).to eq(1)
      expect(result.dig('data', 'createUser', 'user')).to include(
        'name' => 'First Last'
      )
      expect(result['errors']).to eq(nil)
    end
  end

  CREATE_USER_QUERY = <<-EOS
    mutation {
      createUser(input: {
        firstName: "First",
        lastName: "Last",
      }) {
        user {
          id
          name
        }
      }
    }
  EOS
end


