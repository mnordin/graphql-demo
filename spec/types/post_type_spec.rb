require 'rails_helper'

module Types
  describe PostType, type: :graphql do
    it { is_expected.to have_field(:id).of_type(!types.Int) }
    it { is_expected.to have_field(:title).of_type(!types.String) }
    it { is_expected.to have_field(:content).of_type(!TextType) }
    it { is_expected.to have_field(:draft).of_type(types.Boolean) }
    it { is_expected.to have_field(:publishedAt).of_type(DateTimeType) }
    it { is_expected.to have_field(:createdAt).of_type(!DateTimeType) }
    it { is_expected.to have_field(:updatedAt).of_type(!DateTimeType) }

    it { is_expected.to have_field(:user).of_type(!UserType) }
    it { is_expected.to have_field(:comments).of_type(!types[!CommentType]) }
  end
end
