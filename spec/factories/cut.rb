FactoryBot.define do
  factory :cut do
    width {"600"}
    height {"700"}

    association :tracking, :delivery
    program
  end
end
