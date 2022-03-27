class StatsController < ApplicationController

  def index
    area_stats = Stats.historical_area_per_product

    @legends = area_stats.map(&:name).to_json
    @area_values = area_stats.map {|s| { name: s.name, value: s.value }}.to_json

    weight_stats = Stats.historical_weight_per_product
    @weight_values = weight_stats.map {|s| { name: s.name, value: s.value }}.to_json

    stages = Stats.last_two_weeks_workload_per_stage

    tka = 2.week.ago.to_date.strftime("%Y-%m-%d")
    tod = Date.today.strftime("%Y-%m-%d")
    debugger
    lala = Query::TotalWorkload.new(tka, tod).call
    debugger

    @echart_line_days = stages.map {|e| e["date"] }.uniq.sort
    stages_sort = stages.sort_by {|e| e["date"] }
    new_hash = {"Cut" => [], "Drill" => [], "Polish" => [], "Temper" => [], "Delivery" => []}
    stages_sort.map {|a| a.except("date")}.each {|a| new_hash[a["stage_name"]] << a["total_workload"]}
    @echart_line_values = new_hash.to_json
  end
end
