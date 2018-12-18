require 'ostruct'

module Form
  class Order

    include Virtus.model

    include ActiveModel::Model

    attr_accessor :product_lines

    attribute :customer, String
    attribute :description, String
    attribute :delivery_address, String
    attribute :priority, String

    attribute :product_id
    attribute :quantity
    attribute :width
    attribute :height
    attribute :holes_quantity
    attribute :polish_type_id
    attribute :tempered

    def self.association(association, klass)
      @@attributes ||= {}
      @@attributes[association] = klass
    end

    association :product_lines, ::ProductLine

    def self.reflect_on_association(association)
      data = { klass: @@attributes[association] }
      OpenStruct.new data
    end

    # to does not to have to add url: orders_path in form_for
    def self.model_name
      ::Order.model_name
    end

    #def product_lines_attributes=(attributes)
    #  @product_lines ||= []
    #  attributes.each do |i, product_lines_params|
    #    @product_lines_params.push(ProductLine.new(product_lines_params))
    #  end
    #end

    def build_product_lines
      ::ProductLine.new
    end

    def product_lines_attributes=(attributes)
      @product_lines ||= []
      attributes.each do |_int, product_line_params|
        product_line = ProductLine.new(product_line_params)
        @product_lines.push(product_line)
      end
      # @order.product_lines_attributes = (attributes)
    end

    def product_id
      
    end

    def polish_type_id
      
    end

    def persisted?
      false
    end

    def save
      if valid?
        persist!
        true
      else
        false
      end
    end

  # private

    def persist!

      


      @order = ::Order.new(
        customer: customer, 
        description: description, 
        delivery_address: delivery_address, 
        priority: priority)

      
      @order.product_lines = product_lines

      @order.save!
    end

  end
end