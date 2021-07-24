module Report
  module Type
    class LastOrders

      def initialize
        @orders = ::Order.last(10)
      end

      def collection
        @orders
      end

      def filename
        "last_orders_at_#{Time.now.strftime('%y%m%d')}"
      end

      def header_columns
        [:count, :weight, :total_amount]
      end

      def body_columns
        [:order, :created_at, :customer, :priority, :total_products, :amount]
      end

      def footer_columns
        []
      end

      def count_legend
        "Pieces Count"
      end

      def weight_legend
        "Total Weight"
      end

      def total_amount_legend
        "Total $"
      end

      def count_value
        @orders.sum(&:total_products)
      end

      def weight_value
        @orders.sum(&:total_weight)
      end

      def total_amount_value
        @orders.sum(&:amount)
      end

      def order_legend
        "Order No."
      end

      def created_at_legend
        "Created date"
      end

      def customer_legend
        "Customer"
      end

      def priority_legend
        "Priority"
      end

      def total_products_legend
        "Pieces"
      end

      def amount_legend
        "$"
      end

      # sum(&:width) must be 1 for 100% with table
      def order_width
        0.1
      end

      def created_at_width
        0.2
      end

      def customer_width
        0.3
      end

      def priority_width
        0.2
      end

      def total_products_width
        0.1
      end

      def amount_width
        0.1
      end

      def order_value(order)
        order.id.to_s
      end

      def created_at_value(order)
        order.created_at.strftime("%m/%d/%y")
      end

      def customer_value(order)
        order.customer
      end

      def priority_value(order)
        order.priority
      end

      def total_products_value(order)
        order.total_products
      end

      def amount_value(order)
        order.amount
      end
    end
  end
end
