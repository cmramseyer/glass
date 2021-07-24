module Utility
  class PerformCuts
    def initialize(tracking_cuts, user)
      @tracking_cuts = tracking_cuts
      @user = user
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
        ::Service::PerformWork.new(tracking, quantity, @user).run
      end
    end
  end
end
