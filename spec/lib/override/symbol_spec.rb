require 'rails_helper'

RSpec.describe Symbol, type: :model do

  it '#to_humanize' do
    expect(:last_orders.to_humanize).to eq("Last orders")
    expect(:orders.to_humanize).to eq("Orders")
  end

end
