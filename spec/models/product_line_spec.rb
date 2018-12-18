require 'rails_helper'

RSpec.describe ProductLine, type: :model do
  context 'a valid product line' do

    let(:line) { product_lines(:product_line_001) }

    it 'is valid' do
      expect(line.valid?).to be true
    end
    
    it '#width' do
      expect(line.width).to be == 1000
    end

    it '#height' do
      expect(line.height).to be == 1000
    end
  end
end
