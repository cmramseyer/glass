class Cut < ApplicationRecord
  belongs_to :program
  belongs_to :order
  belongs_to :tracking


  def total_area
    tracking.product_line.unit_area * quantity.to_f
  end
end
