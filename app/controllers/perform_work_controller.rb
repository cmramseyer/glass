class PerformWorkController < ApplicationController
  def create
    @tracking = Tracking.find(params[:tracking_id])
    @order = @tracking.order
    @stage = @tracking.stage

    Service::PerformWork.new(@tracking, 1, current_user).run

    redirect_to order_stage_path(order_id: @order.id, id: @stage.id), notice: 'The work was successfuly performed', status: 302

  rescue StandardError => e
    redirect_to order_stage_path(order_id: @order.id, id: @stage.id), alert: "Something went wrong: #{e.message}", status: 302

  rescue Exception
    redirect_to order_stage_path(order_id: @order.id, id: @stage.id), alert: "Unexpected exception! Please check the log!", status: 302
  end
end
