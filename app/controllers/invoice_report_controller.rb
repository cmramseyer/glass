class InvoiceReportController < ApplicationController

  def index
    @order = Order.find(params[:order_id])

    report = Report::Document.new({
      user: current_user,
      obj: @order,
      type: 'Invoice',
      header: 'Simple',
      body: 'Simple',
      footer: 'Simple',
      margin: 'Normal',
      page_size: 'A4' })
    
    report.draw

    send_data report.render, filename: "#{report.filename}.pdf", type: 'application/pdf', disposition: 'inline'

  end

end
