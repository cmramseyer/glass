class ReportsController < ApplicationController

  def index
    
    report = Report::Document.new(
      user: current_user,
      obj: params[:object],
      type: params[:type],
      header: params[:header],
      body: params[:body],
      footer: params[:footer],
      margin: params[:margin],
      page_size: params[:page_size])

    report.draw
    send_data report.render, filename: report.filename, type: 'application/pdf', disposition: 'inline'
  end

  def new
    @options_for_type = Report::Type.constants.map(&:to_humanize)

    # hide Order and Invoice reports beause they need an order object
    @options_for_type.reject! {|o| ["Order", "Invoice"].include? o }

    @options_for_header = Report::Header.constants.map(&:to_humanize)
    @options_for_body = Report::Body.constants.map(&:to_humanize)
    @options_for_footer = Report::Footer.constants.map(&:to_humanize)
    @options_for_margin = Report::Base::MARGIN.keys.map(&:to_humanize)
    @options_for_page_size = Report::Base::PAGE_SIZE.keys.map(&:to_humanize)
  end
end
