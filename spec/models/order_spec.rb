require 'rails_helper'

RSpec.describe Order, type: :model do

  context 'when an order is activated' do
    let(:order) { orders(:basic_order) }
    
    it "it changes status from created to activated" do
      expect{order.activate!}.to change {order.status}.from('created').to('activated')
    end

    it "it changes activated_date" do
      expect{order.activate!}.to change {order.activated_date.class}.from(NilClass).to(ActiveSupport::TimeWithZone)
    end
  end

  it '#total_weight' do
    order = Order.new
    order.product_lines.build.stub(:total_weight) {3}
    order.product_lines.build.stub(:total_weight) {4}
    expect(order.total_weight).to eq(7)
  end

  it '#total_products' do
    order = Order.new
    order.product_lines.build.stub(:quantity) {10}
    order.product_lines.build.stub(:quantity) {2}
    expect(order.total_products).to eq(12)
  end

  it '#amount' do
    order = Order.new
    order.product_lines.build.stub(:amount) {500.0}
    order.product_lines.build.stub(:amount) {101.33}
    expect(order.amount).to eq(601.33)
  end
end
