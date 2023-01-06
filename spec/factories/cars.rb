FactoryBot.define do
  factory :car do
    gas { false }
    maintenance { false }
    association :user, factory: :user
  end
end
