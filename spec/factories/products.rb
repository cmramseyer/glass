FactoryBot.define do
  factory :product do
    name { "Float 4mm. Clear" }
    code { "FL4CLE" }
    thickness {4}
    price_per_m2 {15.0}
  end
end
