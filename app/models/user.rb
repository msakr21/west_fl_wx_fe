class User < ApplicationRecord
  has_one :plan, dependent: :destroy

  validates_presence_of :plan, default: true
  validates_presence_of :prep_kit, default: true
  validates_presence_of :records, default: true
end
