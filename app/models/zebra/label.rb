module Zebra
  class Label

    # so url method from LabelaryApi can access to read @zpl_fina_code
    attr_reader :zpl_final_code

    # data_object is [Data::ProductLine|Data::Order]
    # config is [Config::Default|Config::Alternative|Config::Internal]
    def initialize(data_object, config)
      @data_object = data_object
      @config = config
      @zpl_format = @config.zpl_format
      @label_size = config.label_size
    end

    def url
      "http://api.labelary.com/v1/printers/8dpmm/labels/#{@label_size}/0/#{@zpl_final_code}"
    end

    def generate

      # get data_hash from below
      # get zpl_format from config module extended
      # generates the final zpl replacing data_object values in zpl_format

      @zpl_final_code = Zebra::Replacer.new(@data_object, @zpl_format).zpl
      self
    end
    
  end
end