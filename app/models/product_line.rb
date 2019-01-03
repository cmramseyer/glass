class ProductLine < ApplicationRecord
  belongs_to :product, class_name: 'Product'
  belongs_to :order, optional:  true
  belongs_to :polish_type

  has_many :trackings

  validates :quantity, presence: true, numericality: { greater_than: 0, less_than: 99999 }
  validates :width, presence: true, numericality: { greater_than: 100, less_than: 3600}
  validates :height, presence: true, numericality: { greater_than: 100, less_than: 3600}
  validates :holes_quantity, presence: true, numericality: { greater_than_or_equal_to: 0, less_than: 100}

  # delegate to product
  delegate :name, to: :product, prefix: true, allow_nil: false
  delegate :code, to: :product, prefix: true, allow_nil: false
  delegate :price_per_m2, to: :product, prefix: true, allow_nil: false
  delegate :thickness, to: :product, prefix: true, allow_nil: false
  
  # delegate to polish_type
  delegate :name, to: :polish_type, prefix: true, allow_nil: true
  
  # delegate to order
  delegate :id, to: :order, prefix: true, allow_nil: false
  delegate :customer, to: :order, prefix: true, allow_nil: false
  delegate :delivery_address, to: :order, prefix: true, allow_nil: true

  def size
    "#{width}*#{height}"
  end

  def unit_area
    (width.to_f * height.to_f / 1000000.0).round(2)
  end



  # weight in Kgs
  # 2.5 is a constant
  def unit_weight
    (unit_area * product_thickness * 2.5).round(2)
  end

  def total_area
    (unit_area * quantity).round(2)
  end

  def total_weight
    (unit_weight * quantity).round(2)
  end

  def amount
    total_area * product_price_per_m2
  end

  
  # ORDER = five digits order number filled with leading zero
  # CARDINALITY = three digits cardinality of the product_line in the order
  #               filled with leading zero
  # Barcode will be ORDER + CARDINALITY
  # 00423003 is the barcode for order 423 and third product_line
  def barcode
    str_order = order.id.to_s.rjust(5, '0')
    str_cardinality = 1.to_s.rjust(3, '0')
    str_order + str_cardinality
  end
end