module Stats
  def self.historical_area_per_product
    stats = []

    Product.all.each do |product|
      ostruct = OpenStruct.new(name: product.name, value: 0.0)

      product.product_lines.each do |product_line|
        ostruct.value += product_line.total_area
      end

      stats << ostruct
    end

    stats
  end

  def self.last_two_weeks_workload_per_stage
    stats = []

    # init an array with Date objects
    days = (2.week.ago.to_date..Date.today).to_a

    stats = HashWithIndifferentAccess.new

    # lets iterate over each stage
    Stage.symbols.each do |stage_sym|

      # and over each day
      # and store sum in stats
      # stats be like {cut: 10, drill: 5, ...}
      stats[stage_sym] = days.map do |day|
        # created_at: (day.beginning_of_day..day.end_of day)
        WorkLog.where(created_at: day.to_time.all_day).select { |wl| wl.send("tracking_#{stage_sym.to_s}?") }.sum(&:workload)
      end
    end

    # convert days to an array of human readable dates
    days.map!(&:only_month_day)

    OpenStruct.new(days: days, stats: stats)
    
  end
end