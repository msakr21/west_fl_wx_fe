FactoryBot.define do
  factory :kid do
    medicine { false }
    toys { false }
    clothing { false }
    medical_records { false }
    association :user, factory: :user
  end
end
