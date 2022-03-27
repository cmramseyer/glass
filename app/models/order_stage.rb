class OrderStage

  include Draper::Decoratable

  attr_accessor :stage, :order, :trackings

  delegate :name, to: :stage, prefix: true, allow_nil: false
  delegate :icon_name, to: :stage, prefix: true, allow_nil: false
  delegate :id, to: :order, prefix: true, allow_nil: false
  delegate :id, to: :stage, prefix: true, allow_nil: false
  delegate :icon_name, to: :stage, prefix: true, allow_nil: false


  def initialize(order, stage)
    @order = order
    @stage = stage
    @product_lines = @order.product_lines
    @trackings = Tracking.includes(:product_line).where(stage: stage, product_line_id: @product_lines.ids)

    set_partial_path

  end

  def set_partial_path
    case stage_name
    when 'Cut' then @partial_path = '/stages/product_lines_cut'
    when 'Drill' then @partial_path = '/stages/product_lines_drill'
    when 'Polish' then @partial_path = '/stages/product_lines_polish'
    when 'Temper' then @partial_path = '/stages/product_lines_temper'
    when 'Delivery' then @partial_path = '/stages/product_lines_delivery'
    end
  end

  def to_partial_path
    @partial_path
  end

  def get_color(stage)
    @stage == stage ? "tile-stats-active" : ""
  end

  def has_trackings?
    @trackings.any?
  end

  def total_m2
    total = 0.0
    @trackings.each do |tracking|
      unit_area = tracking.product_line_unit_area
      total += (unit_area * tracking.product_line_quantity).round(2)
    end
    total
  end

  def done_m2
    done = 0.0
    @trackings.each do |tracking|
      unit_area = tracking.product_line_unit_area
      done += (unit_area * tracking.done).round(2)
    end
    done
  end

  def done_percentage
    ((done_m2 / total_m2) * 100.0).to_i
  end

  def done_percentage_string
    if has_trackings?
      "#{done_percentage}%"
    else
      "---"
    end
  end

end
