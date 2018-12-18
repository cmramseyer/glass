FactoryBot.define do
  factory :tracking do
    association :product_line, factory: :product_line
    association :stage, factory: :stage

    done {0}

    trait :with_next_tracking do
      association :next_tracking, factory: :tracking
    end
    trait :delivery do
      association :stage, factory: :stage, name: "Delivery"
    end
    
  end
end

FactoryBot.define do
  factory :tracking_delivery do
    association :product_line, factory: :product_line
    association :stage, factory: :stage
    trait :with_next_tracking do
      association :next_tracking, factory: :tracking
    end
    done {0}
  end
end

