FactoryBot.define do
  factory :stage do
    trait :cut do
      name {"Cut"}
      workload {1.0}
    end

    trait :drill do
      name {"Drill"}
      workload {0.5}
    end

    trait :polish do
      name {"Polish"}
      workload {0.25}
    end

    trait :temper do
      name {"Temper"}
      workload {2.0}
    end

    trait :delivery do
      name {"Delivery"}
      workload {1.5}
    end
  end
end
