require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_one(:plan) }
  end

  describe 'validations' do

  end
end
