# receive an adapter object (OpenStruct) with attributes
# replace each attribute name surrounded by the MARK "**" in the zpl string
# with the attribute value

# Example
# zpl = "111**var_a**111 222**var_b**222"
# open_struct = OpenStruct.new(var_a: 'BAR', var_b: 'FOO')

# Service::ZebraGenerator.new(open_struct, zpl).zpl returns
# "111BAR111 222FOO222"


module Zebra
  class Replacer

    MARK = '**'.freeze

    attr_accessor :zpl

    def initialize(data_object, zpl_format)
      @zpl = zpl_format
      @data_object = data_object
      replace_data_object_in_zpl_format
      check_that_all_variables_wrapped_in_mark_were_replaced
    end

    def replace_data_object_in_zpl_format
      @data_object.instance_variables.each do |ivar|
        @zpl.gsub!("#{MARK}#{ivar}#{MARK}", @data_object.instance_variable_get(ivar))
      end
    end

    def check_that_all_variables_wrapped_in_mark_were_replaced
      raise Error::Zebra.new "One or more variables were not replaced. ZPL string is: #{@zpl}" if @zpl.index(MARK)
    end
    
  end

end