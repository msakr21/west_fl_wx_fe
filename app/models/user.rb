class User < ApplicationRecord
  validates_presence_of :plan_table, default: true
  validates_presence_of :prep_kit_table, default: true
  validates_presence_of :records_table, default: true
  validates_presences_of :first_name, :last_name, :email
  validates_uniqueness_of :email
end
