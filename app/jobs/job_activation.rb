class JobActivation < ApplicationJob
  def perform(order, user)
    # simulates high processing
    puts "Processing order activation..."
    sleep(5)
    ###########################
    Service::OrderActivation.new(order, user).run
    # refresh historical data after a new order has been activated
    puts "Refreshing historical_surface_and_weight_mvw"
    Stats::HistoricalSurfaceAndWeightMvw.refresh
    puts "Refreshing historical_surface_and_weight_mvw done"
  end
end
