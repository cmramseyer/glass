class ZebraPackageLabelController < ApplicationController

  def index
    @order = Order.find(params[:order_id])

    data_object = Zebra::Data::Order.new(@order)
    config = Zebra::Config::Package

    label = Zebra::Label.new(data_object, config).generate

    redirect_to label.url
  end

end
