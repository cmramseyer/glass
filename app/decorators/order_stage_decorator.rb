class OrderStageDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  
  def progress_link
    percentage_string = object.done_percentage_string
    color = case percentage_string
            when "0%"
              'danger'
            when "100%"
              'success'
            else
              'primary'
            end

    if percentage_string == '---'
    else
      tooltip_msg = "Go to #{object.stage.name} Stage of the Order #{object.order.id}"
      h.link_to percentage_string, h.order_stage_path(order_id: object.order.id, id: object.stage.id), class: "btn btn-#{color} btn-xs", data: { toggle: 'tooltip', position: 'top', original_title: tooltip_msg }, target: :_blank
    end
  end

end
