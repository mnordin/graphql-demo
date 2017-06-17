require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:posts) }
  end

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end

  describe '#name' do
    it 'combines first name and last name' do
      user = build(:user, first_name: 'First', last_name: 'Last')

      expect(user.name).to eq('First Last')
    end
  end
end
