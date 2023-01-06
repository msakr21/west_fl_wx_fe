class User < ApplicationRecord
  has_one :plan, dependent: :destroy

  validates_presence_of :plan_table
  validates_presence_of :prep_kit_table
  validates_presence_of :records_table
end
