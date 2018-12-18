module Zebra
  module Config
    module FragilePackage

      def self.label_size
        "4x4"
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
^FO220,375^FDSent date:^FS ^FO350,375^FD**@sent_date**^FS
^FO50,440^GB700,1,3^FS
^CF1,90
^FO80,480^FD--FRAGILE--^FS
^CF0,40
^FO220,600^FDWeight:^FS ^FO320,600^FD**@total_weight**Kg.^FS
^FO220,635^FDPieces:^FS ^FO320,635^FD**@total_products**^FS
^XZ
STR
      end
    end
  end
end