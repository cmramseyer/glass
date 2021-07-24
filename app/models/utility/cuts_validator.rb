module Utility
  class CutsValidator
    attr_accessor :tracking_cuts

    # are there pending cuts for cuts in the new program?
    def initialize(cuts, product)
      @cuts = cuts
      @product = product
      @tracking_cuts = TrackingCuts.new
    end

    def run
      @cuts.each do |cut|
        search_cut_in_tracking(cut, @product)
      end
      self
    end

    private

    def search_cut_in_tracking(cut, product)
      order_id = cut.order.to_i
      quantity = cut.qty.to_i
      width = cut.x.to_i
      height = cut.y.to_i

      order = Order.find(order_id)
      product_lines = order.product_lines.select do |product_line|
        product_line.width == width && product_line.height == height && product_line.product == product
      end

      cut_trackings = Tracking.where(stage: Stage.cut, product_line_id: product_lines.map(&:id))

      raise Error::CutMachineProgram.new "No pending cuts were found for Order #{order_id}, #{product.name} and size #{width}*#{height}" if cut_trackings.empty?

      cut_trackings.each do |tracking|
        raise Error::CutMachineProgram.new "It is not allowed to cut #{quantity} units of #{product.name} from Order #{order_id} because there are only #{tracking.available_works} pending." if quantity > tracking.available_works

        # TODO
        # crear clase TrackingCut que herede de OpenStruct

        @tracking_cuts.add(tracking, quantity)
      end
    end
  end
end
