module Zebra
  module Data
    class Order
      attr_reader :order, :total_weight, :total_products, :customer, :delivery_address, :description, :sent_date

      def initialize(order)
        # assigns instance attributes
        @order = order.id.to_s
        @customer = order.customer[0..14]
        @delivery_address = order.delivery_address[0..29]
        @description = order.description.to_s[0..29]
        @total_weight = order.total_weight.to_s
        @total_products = order.total_products.to_s
        @sent_date = Time.now.strftime("%m/%d/%y")
      end
    end
  end
end
