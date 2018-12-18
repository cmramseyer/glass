module Report
  module Header
    module Simple
      def draw_header

        @pdf.bounding_box([@pdf.bounds.left, @pdf.bounds.top], width: @pdf.bounds.width) do
        
          @data.header_columns.each do |column|
            meth_legend = "#{column}_legend"
            meth_value = "#{column}_value"
            @pdf.text "#{@data.send(meth_legend)}: #{@data.send(meth_value)}"
          end

          @absolute_bottom_header = @pdf.bounds.absolute_bottom
        
        end

        @pdf
        
      end
    end
  end
end
