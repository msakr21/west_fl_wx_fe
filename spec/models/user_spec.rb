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
    it { should validate_presence_of :plan_table }
    it { should validate_presence_of :prep_kit_table }
    it { should validate_presence_of :records_table }
  end
end
