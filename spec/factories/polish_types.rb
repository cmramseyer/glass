FactoryBot.define do
  factory :polish_type do
    
    trait :none do
      name {"None"}
    end

    trait :flat_polish do
      name {"Flat Polish"}
    end

    trait :pencil_edge do
      name {"Pencil Edge"}
    end
  end
end
