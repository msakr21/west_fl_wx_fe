FactoryBot.define do
  factory :pet do
    medicine { false }
    food { false }
    food_water_bowls { false }
    crate { false }
    toys { false }
    association :user, factory: :user
  end
end
