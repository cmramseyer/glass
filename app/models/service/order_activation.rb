module Service
  class OrderActivation < Service::Base

    attr_accessor :order, :result

    def initialize(order, user)
      @order = order
      @user = user
    end

    def run

      handle_service do

        @order.reload

        # create the tracking
        tracking_service = Utility::TrackingGenerator.new(order).run
        tracking_service.tracking_created.map(&:save!)

        ##########################
        # FAKE SERVICES THAT RANDOMLY FAIL!!!
        # SEE AT THE END OF THE CURRENT FILE
        send_mail(@order)
        resupply_products(@order)
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
        Notify.activation_success(@order)
      end

    rescue StandardError => exception
      # This is an async process, better notify results
      # of execution with ActionCable
      Notify.activation_fail(@order, exception)

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
