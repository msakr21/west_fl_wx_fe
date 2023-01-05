require 'faker'

FactoryBot.define do
  factory :user, class: User do
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    email {Faker::Internet.email}
    plan {true}
    records {true}
    prep_kit {true}
    house {Faker::Boolean(true_ratio: 0.5)}
    car {Faker::Boolean(true_ratio: 0.5)}
    kids {Faker::Boolean(true_ratio: 0.5)}
    pets {Faker::Boolean(true_ratio: 0.5)}
  end
end