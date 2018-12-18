module Utility
  module TrackingCondition

    def self.for_drill(product_line)
      product_line.holes_quantity.to_i.positive?
    end

    def self.for_polish(product_line)
      product_line.polish_type.polish?
    end

    def self.for_temper(product_line)
      product_line.tempered
    end

    def self.for_delivery(product_line)
      true
    end
    
  end
end