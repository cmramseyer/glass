class OrderDecorator < ApplicationDecorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def button_go_to
    h.link_to "Order ##{object.id}", h.order_path(object), class: "btn btn-xs #{btn_type}", target: :_blank
  end

  private

  def btn_type
    object.activated? ? "btn-primary" : "btn-default"
  end

end
