FactoryBot.define do
  factory :record do
    medical { false }
    gov_id { false }
    birth_cert { false }
    association :user, factory: :user
  end
end
