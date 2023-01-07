FactoryBot.define do
  factory :plan do
    review_insurance_docs { false }
    check_evac_zone { false }
    evac_plan { false }
    check_evac_route { false }
    three_days_water { false }
    three_days_food { false }
    association :user, factory: :user
  end
end
