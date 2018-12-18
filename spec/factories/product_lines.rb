FactoryBot.define do
  factory :product_line do
    before(:create) do |product_line|
      product_line.order = build(:order)
      product_line.order.product_lines << product_line
    end

    # association :order, factory: :order
    association :product, factory: :product

    quantity {1}
    description {"Window 1"}

    width {555}
    height {666}

    # default: no drill, no polish, no temper
    holes_quantity {0}
    association :polish_type, factory: [:polish_type, :none]
    tempered {false}

    trait :no_drill_no_polish_no_temper do
      holes_quantity {0}
      association :polish_type, factory: [:polish_type, :none]
      tempered {false}
    end
    
    trait :drill_no_polish_no_temper do
      holes_quantity {1}
      association :polish_type, factory: [:polish_type, :none]
      tempered {false}
    end

    trait :drill_polish_no_temper do
      holes_quantity {1}
      association :polish_type, factory: [:polish_type, :flat_polish]
      tempered {false}
    end

    trait :no_drill_polish_no_temper do
      holes_quantity {0}
      association :polish_type, factory: [:polish_type, :flat_polish]
      tempered {false}
    end

    trait :no_drill_no_polish_temper do
      holes_quantity {0}
      association :polish_type, factory: [:polish_type, :none]
      tempered {true}
    end

    trait :drill_polish_temper do
      holes_quantity {1}
      association :polish_type, factory: [:polish_type, :flat_polish]
      tempered {true}
    end

    trait :drill_no_polish_temper do
      holes_quantity {1}
      association :polish_type, factory: [:polish_type, :none]
      tempered {true}
    end

  end
end



