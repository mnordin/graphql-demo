require 'rails_helper'

module Types
  describe CommentType, type: :graphql do
    it { is_expected.to have_field(:id).of_type(!types.Int) }
    it { is_expected.to have_field(:content).of_type(!TextType) }
    it { is_expected.to have_field(:createdAt).of_type(!DateTimeType) }
    it { is_expected.to have_field(:updatedAt).of_type(!DateTimeType) }

    it { is_expected.to have_field(:post).that_returns(!PostType) }
    it { is_expected.to have_field(:user).that_returns(!UserType) }
  end
end
