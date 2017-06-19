require 'rails_helper'

module Types
  describe UserType, type: :graphql do
    it { is_expected.to have_field(:id).of_type(!types.Int) }
    it { is_expected.to have_field(:firstName).of_type(!types.String) }
    it { is_expected.to have_field(:lastName).of_type(!types.String) }
    it { is_expected.to have_field(:createdAt).of_type(!DateTimeType) }
    it { is_expected.to have_field(:updatedAt).of_type(!DateTimeType) }

    it { is_expected.to have_field(:name).of_type(types.String) }

    it { is_expected.to have_field(:posts).of_type(!types[!PostType]) }
  end
end
