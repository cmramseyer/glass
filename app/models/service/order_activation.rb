module Service
  class OrderActivation < Service::Base
    attr_accessor :order, :result

    def initialize(order, user, run_from_script = false)
      @order = order
      @user = user
      @run_from_script = run_from_script
    end

    def run
      handle_service do
        @order.reload
        # create the tracking
        tracking_service = Utility::TrackingGenerator.new(order).run
        tracking_service.persist!
        ##########################
        # FAKE SERVICES THAT RANDOMLY FAIL!!!
        # SEE AT THE END OF THE CURRENT FILE
        send_mail(@order) unless @run_from_script
        resupply_products(@order) unless @run_from_script
        ##########################

        ######################################
        # FINALLY, ORDER IS NOW FULL ACTIVATED
        ######################################
        @order.activate!
        @order.save!
        # create an activity register for the order activation
        Activity.new_activity(@user, :activated, @order, nil)

        # This is an async process, better notify results
        # of execution with ActionCable
        Notify.activation_success(@order) unless @run_from_script
      end

    rescue StandardError => e
      # This is an async process, better notify results
      # of execution with ActionCable
      Notify.activation_fail(@order, e)

    rescue Exception
      # This is an async process, better notify results
      # of execution with ActionCable
      Notify.unexpected
    end

    private

    def send_mail(order)
      # Faking a mail delivery service
      # that sometimes goes wrong
      # Service::MailDeliery.new(@order).run
      raise Error::MailNotDispatched.new(order) if Random.rand(10) > 8
    end

    def resupply_products(order)
      # Faking an external API request to a provider warehouse
      # to resupply products ordered 
      # Service::ResupplyProducts.new(@order).run
      raise Error::ProviderApiServerDown.new(order) if Random.rand(10) > 8
    end
  end
end
