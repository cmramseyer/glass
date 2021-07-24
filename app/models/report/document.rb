module Report
  class Document < Report::Base

    attr_accessor :filename

    def initialize(params = {})
      @params = params
      @obj = params.fetch(:obj, nil)
      @generated_at = Time.now.to_s
      @user = params.fetch(:user, NilUser.new)

      create_pdf_and_set_config

      type = params.fetch(:type, "Last orders").to_s_constant

      @data = "Report::Type::#{type}".constantize.new(@obj)

      # get filename from each @data report type
      @filename = @data.filename
      @path = "#{@filename}.pdf"

      header_str = params.fetch(:header, "Simple").to_s_constant
      body_str = params.fetch(:body, "Simple").to_s_constant
      footer_str = params.fetch(:footer, "Simple").to_s_constant

      header = "Report::Header::#{header_str}".constantize
      body = "Report::Body::#{body_str}".constantize
      footer = "Report::Footer::#{footer_str}".constantize

      self.class.include header
      self.class.include body
      self.class.include footer

      @cursor = @pdf.bounds.top
    end

    def draw
      @pdf.repeat :all do
        draw_header
        draw_footer
      end
      draw_body
      self
    end

    def create_pdf_and_set_config
      margin_symbol = @params.fetch(:margin, "normal").downcase.to_sym
      margin = Report::Base::MARGIN[margin_symbol]
      page_size = @params.fetch(:page_size, "A4").upcase
      @pdf = Prawn::Document.new(margin: margin, page_size: page_size)
    end
  end
end
