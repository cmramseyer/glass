require 'rails_helper'

RSpec.describe Order, type: :model do

  let(:order) { create :order, product_lines: product_lines }
  let(:product_lines) { [product_line_1, product_line_2] }
  let(:product_line_1) { create :product_line, quantity: quantity, width: width, height: height }
  let(:product_line_2) { create :product_line, quantity: quantity_2, width: width_2, height: height_2 }
  let(:quantity) { 1 }
  let(:width) { 600 }
  let(:height) { 600 }
  let(:quantity_2) { 3 }
  let(:width_2) { 900 }
  let(:height_2) { 900 }

  context 'when an order is in status created' do
    let(:status) { 'created' }
    it '#activate! changes status from created to activated' do
      expect { order.activate! }.to change { order.status }.from('created').to('activated')
    end

    it "it changes activated_date" do
      expect { order.activate! }.to change { order.activated_date.class }.from(NilClass).to(ActiveSupport::TimeWithZone)
    end
  end

  it '#total_weight' do
    expect(order.total_weight).to eq(27.9)
  end

  it '#total_products' do
    expect(order.total_products).to eq(4)
  end

  it '#amount' do
    expect(order.amount).to eq(41.85)
  end
end
