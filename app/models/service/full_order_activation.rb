# creates an Order AND try to activate it

# (Service::OrderActivation only tries to activate an
# existing Order)

module Service
  class FullOrderActivation < Service::Base

    def initialize(order, user)
      @order = order
      @user = user
    end

    # es posible que order_creation se ejecute bien
    # y activation falle
    def run
      handle_service do
        @order.save!
        # create an activity register
        ::Activity.new_activity(@user, :created, @order, nil)
        ::JobActivation.perform_later(@order, @user)
      end

      @order
    end
  end
end
