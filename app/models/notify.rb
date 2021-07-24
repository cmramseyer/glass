module Notify

  def self.activation_success(order)
    message = "Order #{order.id} was successfuly activated! Please refresh the Orders page"
    ActionCable.server.broadcast('notification_channel', type: 'success', delay: 8000, message: message)    
  end

  def self.activation_fail(order, exception)
    message = "Order #{order.id} Activation failed: #{exception.message}".squish
    ActionCable.server.broadcast('notification_channel', type: 'error', delay: 12000, message: message)
  end

  def self.unexpected
    message = "Unexpected exception. Please check the log!"
    ActionCable.server.broadcast('notification_channel', type: 'error', delay: 12000, message: message)
  end

  def self.new_activity(activity)
    activity_tr = ApplicationController.renderer.render(partial: '/activities/new_activity', locals: { activity: activity })


    ActionCable.server.broadcast(
      'activity_channel', 
      activity_tr: activity_tr
      )
  end
  
end
