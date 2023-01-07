FactoryBot.define do
  factory :prep_kit do
    batteries { false }
    first_aid_kit { false }
    toiletries { false }
    cash { false }
    association :user, factory: :user
  end
end
