module Service
  class PerformWork < Service::Base
    def initialize(tracking, quantity, user, run_from_script = false)
      @tracking = tracking
      @quantity = quantity
      @user = user
      @run_from_script = run_from_script
    end

    def run
      handle_service do
        # perform the work
        @tracking.perform(@quantity)
        # log the work in database
        WorkLog.create!(tracking: @tracking, quantity: @quantity, user: @user)
        # create an activity register
        new_activity = Activity.new_activity(@user, :performed, @tracking, @quantity)
        # notify the activity through Cable
        Notify.new_activity(new_activity) unless @run_from_script
      end
    end
  end
end
