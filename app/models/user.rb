class User < ApplicationRecord
  validates_presence_of :plan_table, default: true
  validates_presence_of :prep_kit_table, default: true
  validates_presence_of :records_table, default: true
  validates_presence_of :first_name, :last_name, :email
  validates_uniqueness_of :email

  def self.current_user_by_with_conditional(input)
    find_by_id(input) if input
  end

  def self.current_user_by(input)
    find_by_id(input)
  end
end
