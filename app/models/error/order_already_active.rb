module Error
  class OrderAlreadyActive < Error::OrderActivation
    
    attr_accessor :order

    def initialize(order)
      @order = order
    end

    def message
      "The order is already active!"
    end
  end
end
