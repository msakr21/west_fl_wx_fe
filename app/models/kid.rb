class Kid < ApplicationRecord
  belongs_to :user, dependent: :destroy
end
