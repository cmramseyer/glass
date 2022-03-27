module Stats
  class HistoricalSurfaceAndWeightMvw < ApplicationRecord
    self.table_name = 'historical_surface_and_weight_mvw'

    def self.refresh
      Scenic.database.refresh_materialized_view(:historical_surface_and_weight_mvw, concurrently: false, cascade: false)
    end

    def readonly?
      true
    end
  end
end
