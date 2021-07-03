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
    association :polish_type, name: 'None'
    tempered {false}


  end
end
