require 'rails_helper'

module Types
  describe CommentType, type: :graphql_type do
    it { expect have_field(:id).that_returns(!types.ID) }
    it { expect have_field(:content).that_returns(TextType) }
    it { expect have_field(:created_at).that_returns(DateTimeType) }
    it { expect have_field(:updated_at).that_returns(DateTimeType) }

    it { expect have_field(:post).that_returns(PostType) }
    it { expect have_field(:user).that_returns(PostType) }
  end
end
