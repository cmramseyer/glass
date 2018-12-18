class StatsController < ApplicationController

  def index
    stats = Stats.historical_area_per_product

    @legends = stats.map(&:name).to_json
    @values = stats.map {|s| { name: s.name, value: s.value }}.to_json


    stages = Stats.last_two_weeks_workload_per_stage

    @echart_line_days = stages.days
    @echart_line_values = stages.stats.to_json
  end
end
