require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_one(:plan) }
  end

  describe 'validations' do
    it { should validate_presence_of :plan_table }
    it { should validate_presence_of :prep_kit_table }
    it { should validate_presence_of :records_table }
  end
end
