class TrackingCuts

  attr_accessor :tracking_cuts

  def initialize
    @tracking_cuts = []
  end

  def add(tracking, quantity)
    @tracking_cuts << OpenStruct.new(tracking: tracking, quantity: quantity)
  end

end