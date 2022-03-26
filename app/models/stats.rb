module Stats
  def self.historical_area_per_product
    stats = []

    Product.all.includes(:product_lines).each do |product|
      ostruct = OpenStruct.new(name: product.name, value: 0.0)

      product.product_lines.each do |product_line|
        ostruct.value += product_line.total_area
      end

      stats << ostruct
    end

    stats
  end

  def self.historical_weight_per_product
    stats = []

    Product.all.includes(:product_lines).each do |product|
      ostruct = OpenStruct.new(name: product.name, value: 0.0)

      product.product_lines.each do |product_line|
        ostruct.value += product_line.total_weight
      end

      stats << ostruct
    end

    stats
  end

  def self.last_two_weeks_workload_per_stage
    stats = []

    sql = sql_query(2.week.ago.to_date.strftime("%Y-%m-%d"), Date.today.strftime("%Y-%m-%d"))

    results = ActiveRecord::Base.connection.execute(sql)


    results.to_a


    # convert days to an array of human readable dates
    #days.map!(&:only_month_day)

    #OpenStruct.new(days: days, stats: stats)

  end

  def self.last_two_weeks_workload_per_stage_mvw
    stats = []

    # init an array with Date objects
    days = (2.week.ago.to_date..Date.today).to_a

    stats = HashWithIndifferentAccess.new

    stats_mvw = Stats::LastDaysWorkloadMvw.all

    # lets iterate over each stage
    Stage.symbols.each do |stage_sym|

      # and over each day
      # and store sum in stats
      # stats be like {cut: 10, drill: 5, ...}
      stats[stage_sym] = days.map do |day|
        # created_at: (day.beginning_of_day..day.end_of day)
        stats_mvw.detect {|smvw| smvw.name == stage_sym.to_s.capitalize && smvw.created_at == day }&.workload || 0.0
      end
    end

    # convert days to an array of human readable dates
    days.map!(&:only_month_day)

    OpenStruct.new(days: days, stats: stats)

  end

  def self.sql_query(start_date, end_date)
    <<~SQL
      SELECT 
        dates.date, 
        st.stage_name,
        COALESCE(logs.total_workload, 0) total_workload
      FROM
        ( SELECT name stage_name FROM stages ) st
      LEFT JOIN

        ( SELECT date::date
          FROM generate_series('#{start_date}'::date, '#{end_date}'::date, '1 day'::interval) date
        ) dates ON TRUE

      LEFT JOIN

        ( SELECT
            date(work_logs.created_at) date,
            stages.name stage_name,
            ROUND(sum(stages.workload::NUMERIC * work_logs.quantity::NUMERIC * product_lines.width::NUMERIC * product_lines.height::NUMERIC / 1000000.0), 2) total_workload
          FROM
            work_logs
          INNER JOIN trackings ON trackings.id = work_logs.tracking_id
          INNER JOIN stages ON stages.id = trackings.stage_id
          INNER JOIN product_lines ON trackings.product_line_id = product_lines.id
          GROUP BY
            stages.name,
            date(work_logs.created_at)
        ) logs ON dates.date = logs.date AND st.stage_name = logs.stage_name
      ORDER BY dates.date DESC
    SQL

  end
end
