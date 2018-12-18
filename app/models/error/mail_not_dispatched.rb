module Error
  class MailNotDispatched < Error::OrderActivation

    attr_accessor :order

    def initialize(order)
      @order = order
    end

    def message
      "The mail could not be sent. Please, retry later"
    end
  end
end
