require 'rails_helper'

RSpec.describe Zebra::Replacer, type: :model do

  let!(:order) { create :order, product_lines: [product_line] }
  let(:product_line) { build :product_line }
  let(:data) { Zebra::Data::ProductLine.new(product_line)}

  context 'when text with correct marks and variables' do

    let(:zpl) { "abcdef **@customer** 12345 **@description** %&/()"}
    it 'variables are replaced' do
      result = Zebra::Replacer.new(data, zpl).zpl
      expect(result).to be == "abcdef Charlie 12345 Window 1 %&/()"
    end
  end

  context 'when text with wrongs variables' do

    let(:zpl) { "abcdef **@customer** 12345 **@another_var** %&/()"}
    it 'raise error if there are more marks than variables' do
      expect { Zebra::Replacer.new(data, zpl) }.to raise_error(Error::Zebra)
    end

    pending 'empty zpl case'

  end
end
