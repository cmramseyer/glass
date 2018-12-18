class OrderSerializer < ActiveModel::Serializer

  include Rails.application.routes.url_helpers

  attributes :customer, :priority, :status, :stages_stats, :total_products, :created_at, :activated_date

  def stages_stats
    cut = OrderStage.new(object, Stage.cut)
    drill = OrderStage.new(object, Stage.drill)
    polish = OrderStage.new(object, Stage.polish)
    temper = OrderStage.new(object, Stage.temper)
    delivery = OrderStage.new(object, Stage.delivery)
    
    stats = HashWithIndifferentAccess.new
    [cut, drill, polish, temper, delivery].each do |order_stage|
      stats[order_stage.stage_name] = {percentage: order_stage.done_m2, link: order_stage_path(object, order_stage.stage)} if order_stage.has_trackings?
    end
    
    stats
  end

  def total_m2
    object.total_m2
  end

  has_many :product_lines, serializer: ProductLineSerializer

  link(:related) {api_v1_order_path(id: object.id)}

end
