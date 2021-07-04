require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:product) { create :product }

  xit 'add specs' do
  end

  it "check code" do
    expect(product.code).to be == "FL4CLE"
  end
end
