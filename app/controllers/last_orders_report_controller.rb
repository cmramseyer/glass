class LastOrdersReportController < ApplicationController
  def index
    orders = Order.last(5)
    klass = Report::Table::LastOrders
    report = Report::Production::Document.new(orders, klass)
    report.draw

    send_data report.render, filename: "lala.pdf", type: 'application/pdf', disposition: 'inline', target: :_blank
  end
end
