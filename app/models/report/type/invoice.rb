module Report
  module Type
    class Invoice

      FOR_ORDER = true

      def initialize(order)
        @order = order
        @product_lines = order.product_lines
      end

      def header_object
        [@order]
      end

      def collection
        @product_lines
      end

      def filename
        "Invoice Order #{@order.id}"
      end

      def header_columns
        [:order, :customer, :delivery_address]
      end

      def body_columns
        [:product, :quantity, :details, :amount]
      end

      def footer_columns
        []
      end

      def order_legend; "Order No." end
      def customer_legend; "Customer" end
      def delivery_address_legend; "Delivery Addr." end

      # sum(&:width) must be 1 for 100% with table
      def order_width; 0.2 end
      def customer_width; 0.3 end
      def deliver_address_width; 0.5 end

      def order_value
        @order.id.to_s
      end

      def customer_value
        @order.customer
      end

      def delivery_address_value
        @order.delivery_address
      end


      def product_legend
        "Product"
      end

      def quantity_legend
        "Qty."
      end

      def details_legend
        ""
      end

      def amount_legend
        "$"
      end

      def product_width
        0.3
      end

      def quantity_width
        0.1
      end

      def details_width
        0.4
      end

      def amount_width
        0.2
      end

      def product_value(product_line)
        product_line.product_name
      end

      def quantity_value(product_line)
        product_line.quantity
      end

      def details_value(product_line)
        if product_line.holes_quantity.to_i.positive?
          qty = product_line.holes_quantity
          "#{qty} #{'hole'.pluralize(qty)}"
        else
          ""
        end
      end

      def amount_value(product_line)
        product_line.amount
      end

    end
  end
end
