require 'rails_helper'

RSpec.describe Cut, type: :model do

  context 'with a cut' do
    xit 'is valid' do
      expect(cut.valid?).to be true
    end

    # move this to tracking model spec
    xit '#total_area' do
      # 5 glasses, 1000x1000
      expect(cut.total_area).to be 5.0
    end
  end
end
