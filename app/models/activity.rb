class Activity < ApplicationRecord
  belongs_to :user

  belongs_to :object, polymorphic: true

  # type = [:perform_one_work|:order_creation|:order_activation]

  delegate :username, to: :user, prefix: true, allow_nil: false

  def object_detail
    case object.class.name
    when "Order"
      "Order #{object.id} for #{object.customer}"
    when "Tracking"
      "#{quantity} #{object.stage_name} work of #{object.product_line_product_name} #{object.product_line_size} from Order #{object.product_line_order_id} for #{object.product_line_order_customer}"
    when "Program"
      "Cut Machine Program #{object.name}"
    end
  end

  def self.new_activity(user, action, object, quantity = nil)

    Activity.create!(
      user: user,
      action: action.to_s,
      object: object,
      quantity: quantity
      )
    
  end

  
end
