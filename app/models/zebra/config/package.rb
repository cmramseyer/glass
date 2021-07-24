module Zebra
  module Config
    module Package
      def self.label_size
        "4x2"
      end

      def self.zpl_format
        <<-STR
          ^XA
          ^CF0,60
          ^FO220,50^FDInternational Shipping^FS
          ^CF0,40
          ^FO220,100^FDFrom Glass Inc.^FS
          ^FO220,135^FDRosario, Argentina^FS
          ^FO220,170^FDOrder: ^FS ^FO310,170^FD**@order**^FS
          ^FO50,230^GB700,1,3^FS
          ^FO220,280^FDTo:^FS ^FO270,280^FD**@customer**^FS
          ^FO220,315^FDAddr:^FS ^FO290,315^FD**@delivery_address**^FS
          ^XZ
        STR
      end
    end
  end
end
