module Service
  class CreateProgramAndPerformCuts < Service::Base
    def initialize(new_program_input, user)
      @new_program_input = new_program_input
      @user = user
    end

    def run
      handle_service do
        utility_new_program = Utility::NewProgram.new(@new_program_input).run
        program_name = utility_new_program.program_name
        product_code = utility_new_program.product_code
        product = Product.find_by_code(product_code)
        # TODO
        # redundancia dell dato product, decidir por una manera de tratar
        Utility::CheckProgram.name_uniqueness(program_name)
        Utility::CheckProgram.product_existence(product_code)

        cuts = utility_new_program.cuts

        utility_cuts_validator = Utility::CutsValidator.new(cuts, product).run

        # TODO
        # acomodar el desastre de nombres de tracking_cuts
        tracking_cuts = utility_cuts_validator.tracking_cuts.tracking_cuts

        Utility::SaveProgram.new(program_name, product, tracking_cuts, @user).run

        Utility::PerformCuts.new(tracking_cuts, @user).run
      end
    end
  end
end
