module Report
  class Base

    # each Report implements its own header, body and footer
    def draw
      draw_header
      draw_body
      draw_footer
      self
    end

    def render
      @pdf.render
    end

    def save
      @pdf.render_file(@path)
    end

    def save!
      draw
      render
      save
    end

    # TODO: change BODY_COLUMNS to a variable called columns_section
    # with possible values HEADER_COLUMNS, BODY_COLUMNS or FOOTER_COLUMNS
    # so we could iterate over headers and footers info too, not only bodies
    def table_iterator(pdf, data, opts = {})
      rows = []
      
      rows << data.body_columns.map do |column|
        data.send("#{column}_legend")
      end

      table_percentage_width = data.body_columns.map do |column|
        data.send("#{column}_width")
      end

      table_real_width = table_percentage_width.map {|percentage| pdf.bounds.width * percentage}
      
      # pdf.table(header_legend, column_widths: header_real_width, cell_style: { border_width: 0 })

      @data.collection.map do |obj|
        rows << data.body_columns.map do |column|
          data.send("#{column}_value", obj)
        end
      end

      opts = opts.merge!({ column_widths: table_real_width })

      pdf.table(rows, opts)

      pdf
    end

  end
end