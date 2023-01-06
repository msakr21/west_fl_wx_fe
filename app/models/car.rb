class Car < ApplicationRecord
  belongs_to :user, dependent: :destroy
end
