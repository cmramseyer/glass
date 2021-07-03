FactoryBot.define do
  factory :tracking do
    association :product_line, factory: :product_line
    association :stage, factory: :stage
    done {0}
  end
end
