require 'rails_helper'

module Mutations
  describe CreatePost, type: :graphql do
    it { is_expected.to have_an_input_field(:title).of_type(!types.String) }
    it { is_expected.to have_an_input_field(:content).of_type(!Types::TextType) }

    it { is_expected.to have_a_return_field(:post).returning(Types::PostType) }

    it 'creates a Post' do
      user = create(:user, first_name: 'Foo', last_name: 'Bar')

      result = GraphQL::Query.new(
        GraphqlDemoSchema,
        CREATE_POST_QUERY,
        context: {
          current_user: user,
        }
      ).result

      expect(Post.count).to eq(1)
      expect(Post.first.user).to eq(user)
      expect(result.dig('data', 'createPost', 'post')).to include(
        'title' => 'Post title',
      )
      expect(result['errors']).to eq(nil)
    end

    context 'when there is no logged in user' do
      it 'does not create a Post' do
        result = GraphQL::Query.new(
          GraphqlDemoSchema,
          CREATE_POST_QUERY,
          context: {
            current_user: nil,
          }
        ).result

        expect(Post.count).to eq(0)
        expect(result.dig('data', 'createPost')).to eq(nil)
        expect(result['errors'].first).to include(
          'message' => 'Some of your changes could not be saved.',
          'kind' => 'INVALID_ARGUMENTS',
          'invalidArguments' => {},
          'unknownErrors' => [
            {
              modelType: "Post",
              modelRid: nil,
              attribute: :user,
              message: "must exist"
            },
            {
              modelType: "Post",
              modelRid: nil,
              attribute: :user,
              message: "can't be blank"
            }
          ],
        )
      end
    end

    CREATE_POST_QUERY = <<-EOS
      mutation {
        createPost(input: {
          title: "Post title",
          content: "The post content",
        }) {
          post {
            id
            title
          }
        }
      }
    EOS
  end
end
