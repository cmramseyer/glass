module Query
  class TotalWorkload
    def initialize(start_date, end_date)
      @start_date = start_date
      @end_date = end_date
    end

    def call
      dates
      .join(st, Arel::Nodes::OuterJoin)
      .on(Arel::Nodes::True)
      .join(logs, Arel::Nodes::OuterJoin)
      .on(dates[:date].eq(logs[:date]).and.st[:stage_name].eq(logs[:stage_name]))
      .project(dates[:date], st[:stage_name], logs[:total_workload])
    end

    def dates
      Arel::Nodes::As.new(:dates, Arel::Nodes::SqlLiteral.new "SELECT date::date FROM generate_series('#{@start_date}', '#{@end_date}', '1 day'::interval")
      # Arel::Nodes::SqlLiteral.new "SELECT date::date FROM generate_series('#{@start_date}', '#{@end_date}', '1 day'::interval"
      #gen = Arel::Nodes::NamedFunction.new('generate_series',[Arel.sql("date '#{@start_date}'"),Arel.sql("date '#{@end_date}'"),Arel.sql("'1 month'::interval")])
      #Arel::Nodes::As.new(Arel::SelectManager.new.project(Arel.star).from(gen))
    end

    def st
      stages.project(stages[:name])
    end

    def total_workload
      
    end

    def logs
      work_logs.project(work_logs[:created_at].as('date'), stages[:name].as('stage_name'), work_logs[:quantity].sum.as('total_workload'))
      .join(trackings).on(trackings[:id].eq(work_logs[:tracking_id]))
      .join(stages).on(stages[:id].eq(trackings[:stage_id]))
      .join(product_lines).on(product_lines[:id].eq(trackings[:product_line_id]))
      .group(stages[:name], work_logs.created_at)
    end

    def work_logs
      WorkLog.arel_table
    end

    def trackings
      Tracking.arel_table
    end

    def product_lines
      ProductLine.arel_table
    end

    def stages
      Stage.arel_table
    end
  end
end
