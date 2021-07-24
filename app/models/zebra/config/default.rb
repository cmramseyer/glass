module Zebra
  module Config
    module Default
      def self.label_size
        "4x2.5"
      end

      def self.zpl_format
        <<-STR
          ^XA
          ^CF0,60
          ^FO20,20^FDGlass Inc.^FS
          ^CF0,40
          ^FO20,80^FDOrder:^FS
          ^FO480,80^FDSize:^FS
          ^FO20,130^FDCustomer:^FS
          ^FO480,130^FDHoles:^FS
          ^FO20,180^FDDelivery Addr.:^FS
          ^FO20,230^FDProduct:^FS
          ^FO20,280^FDGlass Description:^FS
          ^FO100,80^FD**@order**^FS
          ^FO550,80^FD**@size**^FS
          ^FO150,130^FD**@customer**^FS
          ^FO570,130^FD**@holes**^FS
          ^FO200,180^FD**@delivery**^FS
          ^FO480,180^FD**@polish**^FS
          ^FO130,230^FD**@product**^FS
          ^FO480,230^FD**@tempered**^FS
          ^FO250,280^FD**@description**^FS
          ^BY3,2,100
          ^FO180,330^BC^FD**@barcode**^FS
          ^XZ
        STR
      end
    end
  end
end
