class PrepKit < ApplicationRecord
  belongs_to :user, dependent: :destroy
end
