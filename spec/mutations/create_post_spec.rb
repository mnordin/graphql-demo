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
        create_post_query,
        context: {
          current_user: user,
        }
      ).result

      expect(result['errors']).to eq(nil)
      expect(result.dig('data', 'createPost', 'post')).to match(
        'id' => an_instance_of(Integer),
        'title' => 'Post title',
      )
      expect(Post.count).to eq(1)
      expect(Post.first.user).to eq(user)
    end

    def create_post_query
      <<-EOS
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
end
