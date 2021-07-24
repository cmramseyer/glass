module Handler
  module Service

    def handle_service
      # create and save all, or do nothing
      ActiveRecord::Base.transaction do
        yield
      end
      # alway returns itself
      self
    rescue StandardError => e
      puts e.message
      puts e.backtrace
      raise e
    end
  end
end
