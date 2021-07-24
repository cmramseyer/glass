class JobActivation < ApplicationJob
    def perform(order, user)
      # simulates high processing
      puts "Processing order activation..."
      sleep(5)
      ###########################
      Service::OrderActivation.new(order, user).run
    end
  end
