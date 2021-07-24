class StatsController < ApplicationController

  def index
    area_stats = Stats.historical_area_per_product

    @legends = area_stats.map(&:name).to_json
    @area_values = area_stats.map {|s| { name: s.name, value: s.value }}.to_json

    weight_stats = Stats.historical_weight_per_product
    @weight_values = weight_stats.map {|s| { name: s.name, value: s.value }}.to_json

    stages = Stats.last_two_weeks_workload_per_stage

    @echart_line_days = stages.days
    @echart_line_values = stages.stats.to_json
  end
end
