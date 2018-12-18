require 'rails_helper'

RSpec.describe CustomDateTimeFormat, type: :model do

  

  # year, month, day
  let(:date) { Date.new(2018, 10, 20) }
  let(:time) { Time.parse("2018-10-20 12:35:40") }
  let(:datetime) { DateTime.parse("2018-10-20 12:35:40") }

  it '#normal_format' do
    expect(date.normal_format).to eq("10/20/18 00:00")
    expect(time.normal_format).to eq("10/20/18 12:35")
    expect(datetime.normal_format).to eq("10/20/18 12:35")
  end

  it '#only_date_format' do
    expect(date.only_date_format).to eq("10/20/18")
    expect(time.only_date_format).to eq("10/20/18")
    expect(datetime.only_date_format).to eq("10/20/18")
  end

  it '#only_month_day' do
    expect(date.only_month_day).to eq("10/20")
    expect(time.only_month_day).to eq("10/20")
    expect(datetime.only_month_day).to eq("10/20")
  end

  it '#large_format' do
    expect(date.large_format).to eq("Oct 20, 2018 00:00:00")
    expect(time.large_format).to eq("Oct 20, 2018 12:35:40")
    expect(datetime.large_format).to eq("Oct 20, 2018 12:35:40")
  end



end
