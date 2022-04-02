module Utility
  class PerformCuts
    def initialize(tracking_cuts, user, run_from_script = false)
      @tracking_cuts = tracking_cuts
      @user = user
      @run_from_script = run_from_script
    end

    def run
      perform_cuts
      self
    end

    private

    def perform_cuts
      @tracking_cuts.each do |tracking_cut|
        tracking = tracking_cut.tracking
        quantity = tracking_cut.quantity
        ::Service::PerformWork.new(tracking, quantity, @user, @run_from_script).run
      end
    end
  end
end
