require 'rails_helper'

RSpec.describe Report::Document, type: :model do

  context 'generating last orders report' do

    let(:report) { Report::Document.new({
        type: 'last_orders',
        header: 'simple',
        body: 'simple',
        footer: 'simple',
        margin: 'normal',
        page_size: 'a4'})
        }
    
    let(:pdf) {report.draw.render}

    let(:text_analysis) {PDF::Inspector::Text.analyze(pdf)}

    
    it 'has order data' do
      expect(text_analysis.strings).to include('A customer')
    end

    it 'includes right modules' do
      expect(report.class.ancestors).to include(Report::Header::Simple)
      expect(report.class.ancestors).to include(Report::Body::Simple)
      expect(report.class.ancestors).to include(Report::Footer::Simple)
      expect(report.class.ancestors).to include(Report::Margin::Normal)
      expect(report.class.ancestors).to include(Report::PageSize::A4)
    end

    it 'filename' do
      expect(report.filename).to include('last_orders')
    end

    pending 'add tests'
  end

end
