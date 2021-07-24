module Utility
  class TrackingGenerator
    attr_reader :tracking_created

    def initialize(order)
      @order = order
      @product_lines = @order.product_lines
      @tracking_created = []
    end

    def run
      @product_lines.each do |product_line|
        # create
        # build new trackings for all stages
        cut = Tracking.new(product_line: product_line, stage: Stage.cut, done: 0)
        Stage.stages_for_inject_cut.inject(cut) do |tracking, stage|
          if ::Utility::TrackingCondition.send("for_#{stage.name.underscore}", product_line)
            tracking.build_next_tracking(
              product_line: product_line,
              stage: stage,
              prev_tracking: tracking,
              done: 0
            )
          else
            tracking
          end
        end

        # im gonna store it and perform save! method outside
        # so i can test easily the this class
        @tracking_created << cut
      end
      self
    end
  end
end
