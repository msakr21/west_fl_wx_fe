class User < ApplicationRecord
  has_one :car, dependent: :destroy
  has_one :house, dependent: :destroy
  has_one :kid, dependent: :destroy
  has_one :pet, dependent: :destroy
  has_one :plan, dependent: :destroy
  has_one :prep_kit, dependent: :destroy
  has_one :record, dependent: :destroy

  validates_presence_of :plan_table
  validates_presence_of :prep_kit_table
  validates_presence_of :records_table
end
