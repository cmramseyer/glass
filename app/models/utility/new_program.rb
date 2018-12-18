module Utility
  class NewProgram

    attr_accessor :program_name, :product_code, :new_cuts, :cuts, :readable

    RESERVED_WORDS = ["PROGRAM=", "PRODUCT_CODE=", "NEW_CUT", "ORDER=", "X=", "Y=", "QTY="].freeze

    def initialize(textarea)
      @textarea = textarea
      # new lines will be \n
      @textarea.gsub!("\r\n", "\n")
      @readable = false
      @cuts = []
    end

    def run
      split
      check_reserved_words
      check_and_assign_program_name
      check_and_assign_product_code
      check_new_cut_on_fourth_line
      split_new_cuts
      remove_first_cut # because prev of first NEW_CUT is the program info

      @new_cuts.each do |new_cut|
        # ORDER, QTY, X, Y
        lines = new_cut.split(/[\n]/)
        # TODO
        # fijarse como hacer para q luego de split n queden esp vacios
        lines.reject!(&:empty?)
        check_variables_order(lines)
        add_new_cut_to_cuts(lines)
      end

      @readable = true

      self
    end

    def split
      @text_split = @textarea.split(/[\n]/)
      @text_split.reject!(&:empty?)
    end

    def check_reserved_words
      @text_split.each do |line|
        raise Error::CutMachineProgram.new "#{line} is not an allowed line" unless line.starts_with?(*RESERVED_WORDS)
      end
    end

    def check_one_line_should_start_with_program
      raise Error::CutMachineProgram.new "Only one line must starts with PROGRAM=" if @text_split.select {|line| line.starts_with? "PROGRAM="}.many?
    end

    def check_one_line_should_start_with_product_code
      raise Error::CutMachineProgram.new "Only one line must starts with PRODUCT_CODE=" if @text_split.select {|line| line.starts_with? "PRODUCT_CODE="}.many?
    end

    def check_and_assign_program_name
      line = @text_split[0]
      # [0] here, but 1st line in textarea user input
      raise Error::CutMachineProgram.new "Line 1 must be PROGRAM=" unless line.starts_with? "PROGRAM="
      match = line.match(/PROGRAM=(.*$)/)
      @program_name = match[1]
    end

    def check_and_assign_product_code
      line = @text_split[1]
      # [1] here, but 2nd line in textarea user input
      raise Error::CutMachineProgram.new "Line 2 must be PRODUCT_CODE=" unless line.starts_with? "PRODUCT_CODE="
      match = line.match(/PRODUCT_CODE=(.*$)/)
      @product_code = match[1]
    end
    
    def check_new_cut_on_fourth_line
      line = @text_split[2]
      # [2] here, but 3rd line in textarea user input
      raise Error::CutMachineProgram.new "Line 3 must be NEW_CUT" unless line.starts_with? "NEW_CUT"
    end

    def split_new_cuts
      @new_cuts = @textarea.split(/NEW_CUT\n/)
    end

    def remove_first_cut
      # first element of @new_cuts it is not a cut
      # it has PROGRAM and PRODUCT_CODE lines
      @new_cuts.shift
    end

    def check_variables_order(lines)
      

      raise Error::CutMachineProgram.new "Line 1 inside a NEW_CUT block must be ORDER=" unless lines[0].starts_with? "ORDER="
      raise Error::CutMachineProgram.new "Line 2 inside a NEW_CUT block must be QTY=" unless lines[1].starts_with? "QTY="
      raise Error::CutMachineProgram.new "Line 3 inside a NEW_CUT block must be X=" unless lines[2].starts_with? "X="
      raise Error::CutMachineProgram.new "Line 4 inside a NEW_CUT block must be Y=" unless lines[3].starts_with? "Y="
    end

    def add_new_cut_to_cuts(lines)
      cut = OpenStruct.new
      
      match = lines[0].match(/ORDER=(.*$)/)
      cut.order = match[1]

      match = lines[1].match(/QTY=(.*$)/)
      cut.qty = match[1]

      match = lines[2].match(/X=(.*$)/)
      cut.x = match[1]

      match = lines[3].match(/Y=(.*$)/)
      cut.y = match[1]

      @cuts << cut
      
    end

  end
end
