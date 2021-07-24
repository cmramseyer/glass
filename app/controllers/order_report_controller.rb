class OrderReportController < ApplicationController

  def index
    @order = Order.find(params[:order_id])

    report = Report::Document.new({
      obj: @order,
      user: current_user,
      type: "Order",
      header: "Simple",
      body: "Simple",
      footer: "Generated info",
      margin: "Normal",
      page_size: "A4" })

    report.draw

    send_data report.render, filename: "#{report.filename}.pdf", type: 'application/pdf', disposition: 'inline'

  end

end
