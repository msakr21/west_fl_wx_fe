FactoryBot.define do
  factory :car do
    gas { false }
    maintenance { false }
    user { nil }
  end
end
