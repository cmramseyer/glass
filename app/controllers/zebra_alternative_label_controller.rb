class ZebraAlternativeLabelController < ApplicationController

  def index
    @product_line = ProductLine.find(params[:product_line_id])

    data_object = Zebra::Data::ProductLine.new(@product_line)
    config = Zebra::Config::Alternative

    label = Zebra::Label.new(data_object, config).generate

    redirect_to label.url

  end

end
