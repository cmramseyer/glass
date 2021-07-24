class CreateLastDaysWorkloadMvw < ActiveRecord::Migration[5.2]
  def change
    create_view :last_days_workload_mvw, materialized: true
  end
end
