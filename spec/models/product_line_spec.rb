require 'rails_helper'

RSpec.describe ProductLine, type: :model do
  context 'a valid product line' do

    let(:line) { create :product_line }

    it 'is valid' do
      expect(line.valid?).to be true
    end
    xit 'add barcode specs' do
    end
  end
end
