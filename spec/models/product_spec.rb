require 'rails_helper'

RSpec.describe Product, type: :model do
  it "check code" do
    product = products(:fl4cle)
    expect(product.code).to be == "FL4CLE"
  end
end
