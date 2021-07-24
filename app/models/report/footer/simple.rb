module Report
  module Footer
    module Simple
      FOOTER_HEIGHT = 30

      def draw_footer
        @pdf.bounding_box([@pdf.bounds.left, @pdf.bounds.bottom + FOOTER_HEIGHT], width: @pdf.bounds.width) do

          @absolute_top_footer = @pdf.bounds.absolute_top 

          @pdf.text "Simple footer", align: :center, font_size: 10
        end
      end
    end
  end
end
