module Utility
  module CheckProgram
    def self.name_uniqueness(name)
      raise Error::CutMachineProgram.new "Program name exists" if Program.find_by_name(name) || name.blank?
    end

    def self.product_existence(product_code)
      raise Error::CutMachineProgram.new "'#{product_code}'' is a Product Code invalid. Permitted codes: #{Product.all.map(&:code).join('|')}" unless Product.find_by_code(product_code)
    end
  end
end
