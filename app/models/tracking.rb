class Tracking < ApplicationRecord

  WORKSDONE = 1

  # RELATIONSHIPS
  # each tracking register is for a product_line
  # at a particular stage
  belongs_to :product_line
  belongs_to :stage

  # each tracking points to the next tracking register
  belongs_to :next_tracking, class_name: Tracking, optional: true, autosave: true
  belongs_to :prev_tracking, class_name: Tracking, optional: true, autosave: true

  has_many :cuts

  has_many :activities, as: :object

  has_many :work_logs
  # END RELATIONSHIPS

  # VALIDATIONS

  # next_tracking must be present unless the track is a delivery
  validates :next_tracking, presence: true, unless: -> {stage.name == "Delivery"}
  # prev_tracking must be present unless the track is a delivery
  validates :prev_tracking, presence: true, unless: -> {stage.name == "Cut"}


  # END VALIDATIONS

  # delegate to product_line
  delegate :order, to: :product_line, prefix: true, allow_nil: false
  delegate :order_id, to: :product_line, prefix: true, allow_nil: false
  delegate :order_customer, to: :product_line, prefix: true, allow_nil: false
  delegate :quantity, to: :product_line, prefix: true, allow_nil: false
  delegate :width, to: :product_line, prefix: true, allow_nil: false
  delegate :height, to: :product_line, prefix: true, allow_nil: false
  delegate :holes_quantity, to: :product_line, prefix: true, allow_nil: true
  delegate :polish_type_name, to: :product_line, prefix: true, allow_nil: true
  delegate :tempered, to: :product_line, prefix: true, allow_nil: true
  delegate :unit_area, to: :product_line, prefix: true, allow_nil: true
  delegate :product_name, to: :product_line, prefix: true, allow_nil: false
  delegate :product_code, to: :product_line, prefix: true, allow_nil: false
  delegate :size, to: :product_line, prefix: true, allow_nil: false
  
  # delegate to stage
  delegate :name, to: :stage, prefix: true, allow_nil: false
  delegate :workload, to: :stage, prefix: true, allow_nil: false

  # are there works done in the previous stage and ready to be
  # drilled/polished/tempered/delivered?
  def available_works?
    if prev.valid_tracking?
      prev.done > done
    else
      product_line_quantity > done
    end
  end

  def order
    product_line_order
  end

  def available_works
    if prev.valid_tracking?
      prev.done - done
    else
      product_line_quantity - done
    end
  end

  def valid_tracking?
    true
  end

  def prev
    prev_tracking || NilTracking.new
  end

  def next
    next_tracking || NilTracking.new
  end

  def perform(quantity_done = WORKSDONE)
    raise Error::UnavailableWorks.new unless available_works?
    raise Error::UnavailableWorks.new unless allow_perform(quantity_done)
    
    current_done = done
    
    update_attribute :done, current_done + quantity_done
  end

  def allow_perform(quantity)
    done + quantity <= product_line_quantity
  end

  def unit_workload
    stage_workload * product_line_unit_area
  end

  def cut?
    stage == Stage.cut
  end

  def drill?
    stage == Stage.drill
  end

  def polish?
    stage == Stage.polish
  end

  def temper?
    stage == Stage.temper
  end

  def delivery?
    stage == Stage.delivery
  end

end
