module Report
  module Body
    module Simple

      TOP_MARGIN = 30
      BOTTOM_MARGIN = 50

      def draw_body

        @pdf.bounding_box([@pdf.bounds.left, @absolute_bottom_header - TOP_MARGIN], width: @pdf.bounds.width, height: @absolute_bottom_header - @absolute_top_footer - BOTTOM_MARGIN) do

          @pdf = table_iterator(@pdf, @data, { cell_style: { border_width: 0 } }) do
            cells.padding = 12
          end

        end
      end
    end
  end
end
