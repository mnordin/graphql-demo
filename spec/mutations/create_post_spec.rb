require 'rails_helper'

module Mutations
  describe CreatePost, type: :graphql do
    it { is_expected.to have_an_input_field(:title).of_type(!types.String) }
    it { is_expected.to have_an_input_field(:content).of_type(!Types::TextType) }

    it { is_expected.to have_a_return_field(:post).returning(Types::PostType) }
  end
end
