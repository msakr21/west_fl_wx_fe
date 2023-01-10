require 'faker'

FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    plan_table { true }
    records_table { true }
    prep_kit_table { true }
    house_table { Faker::Boolean.boolean(true_ratio: 0.5) }
    car_table { Faker::Boolean.boolean(true_ratio: 0.5) }
    kids_table { Faker::Boolean.boolean(true_ratio: 0.5) }
    pets_table { Faker::Boolean.boolean(true_ratio: 0.5) }
  end
end
