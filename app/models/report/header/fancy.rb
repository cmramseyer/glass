module Report
  module Header
    module Fancy

      PAD_WIDTH = 20
      PAD_HEIGHT = 20

      def draw_header

        

        @pdf.bounding_box([@pdf.bounds.left, @pdf.cursor], width: @pdf.bounds.width) do

          @pdf.bounding_box([@pdf.bounds.left - PAD_WIDTH, @pdf.cursor - PAD_HEIGHT], width: @pdf.bounds.width) do

            @pdf.text "Glass Inc.", align: :right, font_size: 15

            @pdf.move_down 10
          
            @data.header_columns.each do |column|
              meth_legend = "#{column}_legend"
              meth_value = "#{column}_value"
              @pdf.text "---#{@data.send(meth_legend)}: #{@data.send(meth_value)}---", align: :center, style: :bold, color: [22, 55, 79, 30]
            end
          end

          @absolute_bottom_header = @pdf.bounds.absolute_bottom

          @pdf.stroke_bounds

        
        end

      end
    end
  end
end
