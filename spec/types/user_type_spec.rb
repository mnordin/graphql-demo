require 'rails_helper'

module Types
  describe UserType, type: :graphql_type do
    it { expect have_field(:id).that_returns(!types.ID) }
    it { expect have_field(:first_name).that_returns(types.String) }
    it { expect have_field(:last_name).that_returns(types.String) }
    it { expect have_field(:created_at).that_returns(DateTimeType) }
    it { expect have_field(:updated_at).that_returns(DateTimeType) }

    it { expect have_field(:name).that_returns(types.String) }

    it { expect have_field(:posts).that_returns([PostType]) }
  end
end
