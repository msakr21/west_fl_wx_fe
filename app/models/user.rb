class User < ApplicationRecord
  has_one :car, dependent: :destroy
  has_one :house, dependent: :destroy
  has_one :kid, dependent: :destroy
  has_one :pet, dependent: :destroy
  has_one :plan, dependent: :destroy
  has_one :prep_kit, dependent: :destroy
  has_one :record, dependent: :destroy

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

  def self.current_user_by_with_conditional(input)
    find_by(id: input) if input
  end

  def self.current_user_by(input)
    find_by(id: input)
  end
end
