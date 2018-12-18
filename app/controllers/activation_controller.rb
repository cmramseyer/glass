class ActivationController < ApplicationController

  def create
    @order = Order.find(params[:order_id])

    
    JobActivation.perform_later(@order, current_user)

    success_response("The Activation was launched! A process result notification will appear!")
    


  end

end
