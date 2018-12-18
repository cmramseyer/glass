module Zebra
  module Config
    module Alternative

      def self.label_size
        "3.5x1.2"
      end

      def self.zpl_format
<<-STR
^XA
^CF0,90
^FO20,20^FDGlass Inc.^FS
^CF0,30
^FO300,20^FDOrder:^FS
^FO300,60^FDSize:^FS
^FO20,90^FDCustomer:^FS
^FO20,120^FDProduct:^FS
^FO360,20^FD**@order**^FS
^FO350,60^FD**@size**^FS
^FO120,90^FD**@customer**^FS
^FO110,120^FD**@product**^FS
^FO480,20
^BXN,10,200
^FD**@barcode**
^XZ
STR
      end
    end
  end
end