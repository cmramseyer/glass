module Stats
  class LastDaysWorkloadMvw < ApplicationRecord
    self.table_name = 'last_days_workload_mvw'

    def self.refresh
      Scenic.database.refresh_materialized_view(:last_days_workload_mvw, concurrently: false, cascade: false)
    end

    def readonly?
      true
    end
  end
end
