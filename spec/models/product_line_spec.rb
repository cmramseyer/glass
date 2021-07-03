require 'rails_helper'

RSpec.describe ProductLine, type: :model do
  context 'a valid product line' do

    let(:line) { product_lines(:product_line_001) }

    it 'is valid' do
      expect(line.valid?).to be true
    end
    xit 'add barcode specs' do
    end
  end
end
