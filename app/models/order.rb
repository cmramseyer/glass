class Order < ApplicationRecord
  has_many :product_lines, inverse_of: :order

  has_many :activities, as: :object
  
  validates_presence_of :product_lines

  validates :customer, presence: true

  accepts_nested_attributes_for :product_lines, allow_destroy: true

  enum status: [:created, :activated, :finished]

  # validates :state, inclusion: {in: STATES}

  def activate!
    activated!
    update_attributes(
      last_activation_message: 'Activation Complete!',
      activated_date: Time.now
    )
  end

  def total_weight
    product_lines.sum(&:total_weight).round(2)
  end

  def total_products
    product_lines.sum(&:quantity)
  end

  def amount
    product_lines.sum(&:amount).round(2)
  end

end
