require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_one(:car) }
    it { should have_one(:house) }
    it { should have_one(:kid) }
    it { should have_one(:pet) }
    it { should have_one(:plan) }
    it { should have_one(:prep_kit) }
    it { should have_one(:record) }
  end

  describe 'validations' do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of(:email) }
  end
end
