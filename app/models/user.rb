class User < ApplicationRecord
  validates_presence_of :plan, default: true
  validates_presence_of :prep_kit, default: true
  validates_presence_of :records, default: true
end
