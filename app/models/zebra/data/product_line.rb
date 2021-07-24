module Zebra
  module Data
    class ProductLine
      attr_reader :order, :size, :customer, :holes, :delivery, :polish, :product, :product_code, :tempered, :description, :barcode

      def initialize(product_line)
        # assigns instance attributes
        # so self.attributes will return a hash with the attributes values
        # {order: "1234", size: "444*555", ...}
        @order = product_line.order_id.to_s
        @size = "#{product_line.width}*#{product_line.height}"
        @customer = product_line.order_customer[0..14]
        @holes = product_line.holes_quantity.to_i.to_s
        @delivery = product_line.order_delivery_address[0..29]
        @polish = product_line.polish_type_name.to_s
        @product = product_line.product_name.to_s
        @product_code = product_line.product_code.to_s
        @tempered = product_line.tempered ? "Tempered" : ""
        @description = product_line.description.to_s[0..29]
        @barcode = product_line.barcode
      end
    end
  end
end
