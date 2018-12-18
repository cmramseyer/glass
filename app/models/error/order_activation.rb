module Error
  class OrderActivation < StandardError

    attr_accessor :order

    def initialize(order)
      @order = order
    end

  end
end
