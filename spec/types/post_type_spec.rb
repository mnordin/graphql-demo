require 'rails_helper'

module Types
  describe PostType, type: :graphql_type do
    it { expect have_field(:id).that_returns(!types.ID) }
    it { expect have_field(:title).that_returns(types.String) }
    it { expect have_field(:content).that_returns(TextType) }
    it { expect have_field(:draft).that_returns(types.Boolean) }
    it { expect have_field(:published_at).that_returns(DateTimeType) }
    it { expect have_field(:created_at).that_returns(DateTimeType) }
    it { expect have_field(:updated_at).that_returns(DateTimeType) }

    it { expect have_field(:user).that_returns(UserType) }
    it { expect have_field(:comments).that_returns([CommentType]) }
  end
end
