FactoryBot.define do
  factory :house do
    trim_trees { false }
    clear_yard { false }
    shutters { false }
    fill_bathtub { false }
    user { nil }
  end
end
