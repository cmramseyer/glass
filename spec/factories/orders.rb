FactoryBot.define do
  factory :order do
    customer {"Charlie"}
    description {"New Office"}
    delivery_address {"Mendoza 2138"}
    priority {'2 - Normal'}
    status { 0 }
    trait :invalid do
      customer {""}
    end
  end
end
