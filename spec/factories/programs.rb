FactoryBot.define do
  factory :program do
    sequence :name do |n|
      "PROGRAM#{n}"
    end
    user
    association :product, factory: :product

    trait :with_cuts do
      before(:create) do |program|
        cuts = create_list(:cut, 1, program: program)
        program.cuts << cuts
      end
    end
  end

end
