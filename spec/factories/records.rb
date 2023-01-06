FactoryBot.define do
  factory :record do
    medical { false }
    id { false }
    birth_cert { false }
    association :user, factory: :user
  end
end
