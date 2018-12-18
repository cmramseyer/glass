require 'rails_helper'

RSpec.describe String, type: :model do

  it '#to_humanize' do
    expect("Last orders".to_s_constant).to eq("LastOrders")
    expect("Orders".to_s_constant).to eq("Orders")
    expect("".to_s_constant).to eq("")
  end

end
