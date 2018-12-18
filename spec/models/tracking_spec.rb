require 'rails_helper'

RSpec.describe Tracking, type: :model do

  context 'for a valid and ready cut tracking' do
    let(:track){ trackings(:track_001) }
    
    it '#available_works?' do
      expect(track.available_works?).to be true
    end

    it '#available_works' do
      expect(track.available_works).to be 5
    end

    it '#valid_tracking?' do
      expect(track.valid_tracking?).to be true
    end

    it '#prev' do
      expect(track.prev).to be_a(NilTracking)
    end

    it '#next' do
      expect(track.next).to eq(trackings(:track_002))
    end

    it '#cut?' do
      expect(track.cut?).to be true
    end

    it '#drill?' do
      expect(track.drill?).to be false
    end

    it '#polish?' do
      expect(track.polish?).to be false
    end

    it '#temper?' do
      expect(track.temper?).to be false
    end

    it '#delivery?' do
      expect(track.drill?).to be false
    end

    it '#unit_workload' do
      # area = 1 m2 = (1000x1000)
      # stage cut workload = 0.1
      expect(track.unit_workload).to be 0.1
    end

    it '#perform with no quantity params' do
      expect { track.perform }.to change {track.done }.from(0).to(1)
    end

    # available_works => 5
    it '#perform more works than available raise error' do
      expect { track.perform(6) }.to raise_error { Error::UnavailableWorks }
    end

    it '#perform a cut make drill works available' do
      track.perform
      expect(trackings(:track_002).available_works?).to be true
      expect(trackings(:track_002).available_works).to be 1
    end

    it '#perform 3 works' do
      expect { track.perform(3) }.to change {track.done }.from(0).to(3)
    end

  end

  context 'for a valid and not ready drill tracking' do
    let(:track) {trackings(:track_002)}

    it '#available_works?' do
      expect(track.available_works?).to be false
    end

    it '#available_works' do
      expect(track.available_works).to be 0
    end

    it '#valid_tracking?' do
      expect(track.valid_tracking?).to be true
    end

    it '#prev' do
      expect(track.prev).to eq(trackings(:track_001))
    end

    it '#next' do
      expect(track.next).to eq(trackings(:track_003))
    end

    it '#cut?' do
      expect(track.cut?).to be false
    end

    it '#drill?' do
      expect(track.drill?).to be true
    end

    it '#polish?' do
      expect(track.polish?).to be false
    end

    it '#temper?' do
      expect(track.temper?).to be false
    end

    it '#delivery?' do
      expect(track.delivery?).to be false
    end

    it '#unit_workload' do
      # area = 1 m2 = (1000x1000)
      # stage cut workload = 0.15
      expect(track.unit_workload).to be 0.15
    end

    it '#perform with no quantity params raise error' do
      expect { track.perform }.to raise_error { Error::UnavailableWorks }
    end

    

    it '#perform 3 works raise error' do
      expect { track.perform(3) }.to raise_error { Error::UnavailableWorks }
    end

  end

end
