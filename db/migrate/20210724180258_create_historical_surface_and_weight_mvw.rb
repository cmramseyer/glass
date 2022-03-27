class CreateHistoricalSurfaceAndWeightMvw < ActiveRecord::Migration[5.2]
  def change
    create_view :historical_surface_and_weight_mvw, materialized: true
  end
end
