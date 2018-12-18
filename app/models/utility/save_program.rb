module Utility
  class SaveProgram

    def initialize(program_name, product, tracking_cuts, user)
      @program_name = program_name
      @product = product
      @tracking_cuts = tracking_cuts
      @user = user
    end

    def run
      new_program
      save_cuts_and_program
      self
    end

    private

    def new_program
      @program = Program.new(
        name: @program_name,
        user: @user,
        product: @product
      )
    end

    def save_cuts_and_program

      @tracking_cuts.each do |tracking_cut|

        Cut.create!(
          program: @program,
          order: tracking_cut.tracking.product_line_order,
          quantity: tracking_cut.quantity,
          width: tracking_cut.tracking.product_line_width,
          height: tracking_cut.tracking.product_line_height,
          tracking: tracking_cut.tracking
        )
      end

      @program.save!
    end


  end
end