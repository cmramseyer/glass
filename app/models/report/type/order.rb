module Report
  module Type
    class Order

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
        "Order #{@order.id}"
      end

      def header_columns
        [:order, :created_at, :customer, :priority, :delivery_address]
      end

      def body_columns
        [:product, :quantity]
      end

      def footer_columns
        []
      end

      def order_legend; "Order No." end
      def created_at_legend; "Created date" end
      def customer_legend; "Customer" end
      def priority_legend; "Priority" end
      def delivery_address_legend; "Delivery Addr." end

      # sum(&:width) must be 1 for 100% with table
      def order_width; 0.1 end
      def created_at_width; 0.2 end
      def customer_width; 0.3 end
      def priority_width; 0.1 end
      def deliver_address_width; 0.3 end

      def order_value
        @order.id.to_s
      end

      def created_at_value
        @order.created_at.strftime("%m/%d/%y")
      end

      def customer_value
        @order.customer
      end

      def priority_value
        @order.priority
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

      def product_width
        0.7
      end

      def quantity_width
        0.3
      end

      def product_value(product_line)
        product_line.product.name
      end

      def quantity_value(product_line)
        product_line.quantity
      end

    end
  end
end
