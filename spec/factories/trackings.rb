FactoryBot.define do
  factory :tracking do
    association :product_line, factory: :product_line
    done {0}
  end
end
