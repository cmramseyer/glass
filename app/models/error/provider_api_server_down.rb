module Error
  class ProviderApiServerDown < Error::OrderActivation

    attr_accessor :order

    def initialize(order)
      @order = order
    end

    def message
      'The Provider API Server for the new order for products stock is down right now. Please, retry later.'
    end
  end
end
