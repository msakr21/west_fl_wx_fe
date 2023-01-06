class House < ApplicationRecord
  belongs_to :user, dependent: :destroy
end
