FactoryBot.define do
  factory :user do
    sequence :username do |n|
      "user_#{n}"
    end

    sequence :email do |n|
      "user#{n}@mail.com"
    end
  end
end
