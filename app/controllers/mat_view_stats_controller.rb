class MatViewStatsController < ApplicationController

  def index
    stats = Stats::HistoricalSurfaceAndWeightMvw.all

    @legends = stats.map(&:name).to_json
    @area_values = stats.map {|s| { name: s.name, value: s.total_area || 0 }}.to_json
    @weight_values = stats.map {|s| { name: s.name, value: s.total_weight || 0}}.to_json

    stages = Stats.last_two_weeks_workload_per_stage_mvw

    @echart_line_days = stages.days
    @echart_line_values = stages.stats.to_json

    render 'stats/index'
  end
end
