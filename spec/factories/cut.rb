FactoryBot.define do
  factory :cut do
    width {"600"}
    height {"700"}

    association :tracking, :delivery
    
    program

    before(:create) do |cut|
      # cut.program = build :program
      # cut.program.cuts << cut

      cut.order = build :order
      cut.order = cut.tracking.product_line.order
    end


  end

  factory :cut_2, class: Cut do
    width {"600"}
    height {"700"}

    association :tracking, :delivery

    
    before(:create) do |cut|

      debugger
      
      cut.order = build :order
      cut.order = cut.tracking.product_line.order
    end


  end
end
