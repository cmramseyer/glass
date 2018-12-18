class JobLauncher < ApplicationJob
    def perform(object, method, user = nil)
      # simulates high processing
      sleep(5)
      ###########################
      object.try(method.to_sym, user)
    end
  end