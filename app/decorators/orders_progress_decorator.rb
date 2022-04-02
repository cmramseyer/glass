class OrdersProgressDecorator < ApplicationDecorator
  delegate_all


  def button_go_to
    h.link_to "Order ##{object.id}", h.order_path(object), class: "btn btn-xs #{btn_type}", target: :_blank
  end

  def progress_link(stage_name)
    stage = Stage.send(stage_name)
    progress = object.send(stage_name)
    round_progress = progress.round(0).to_i
    progress_string = "#{round_progress}%"
    color = case round_progress
            when 0
              'danger'
            when 100
              'success'
            else
              'primary'
            end

    
    tooltip_msg = "Go to #{stage_name} Stage of the Order #{object.id}"
    h.link_to progress_string, h.order_stage_path(order_id: object.id, id: stage.id), class: "btn btn-#{color} btn-xs", data: { toggle: 'tooltip', position: 'top', original_title: tooltip_msg }, target: :_blank
  end

  private

  def btn_type
    object.activated? ? "btn-primary" : "btn-default"
  end

end
