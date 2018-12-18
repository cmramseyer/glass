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


FactoryBot.define do
  factory :order_one_line, parent: :order do
    product_lines {create_list :product_line, 1, :drill_polish_temper, order: order}
  end
    
end

FactoryBot.define do
  factory :order_two_lines, parent: :order do
    product_lines {create_list :product_line, 2}
  end
    
end
