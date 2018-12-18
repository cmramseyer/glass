class Program < ApplicationRecord
  belongs_to :user
  belongs_to :product

  has_many :cuts

  delegate :username, to: :user, prefix: true, allow_nil: false

  attr_accessor :new_program

  def total_cuts
    cuts.sum(&:quantity)
  end

  def total_area
    cuts.sum(&:total_area)
  end
end
