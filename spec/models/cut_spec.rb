require 'rails_helper'

RSpec.describe Cut, type: :model do
  context 'with a cut' do
    let(:cut) { cuts(:cut_001) }

    it 'is valid' do
      expect(cut.valid?).to be true
    end

    it '#total_area' do
      # 5 glasses, 1000x1000
      expect(cut.total_area).to be 5.0
    end
  end
end
