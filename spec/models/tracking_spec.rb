require 'rails_helper'

require 'support/tracking_support'

RSpec.describe Tracking, type: :model do

  include TrackingSupport

  let!(:trackings) { create_trackings(cut_track, drill_track, polish_track, temper_track, delivery_track) }

  let(:user) { create :user }
  let(:quantity) { 5 }
  let(:product_line) { create :product_line, quantity: quantity, width: 1000, height: 1000 }
  let(:program) {create :program, user: user, product: product_line.product }

  let(:cut_stage) { create :stage, :cut, workload: 0.1 }
  let(:drill_stage) { create :stage, :drill, workload: 0.15 }
  let(:polish_stage) { create :stage, :drill, workload: 0.2 }
  let(:temper_stage) { create :stage, :temper, workload: 1.5 }
  let(:delivery_stage) { create :stage, :delivery, workload: 0.3 }
  let(:cut) { create :cut, program: program }

  let(:delivery_track) { build :tracking, stage: delivery_stage, product_line: product_line }
  let(:temper_track) { build :tracking, stage: temper_stage, product_line: product_line }
  let(:polish_track) { build :tracking, stage: polish_stage, product_line: product_line }
  let(:drill_track) { build :tracking, stage: drill_stage, product_line: product_line }
  let(:cut_track) { build :tracking, stage: cut_stage, product_line: product_line }

  context 'for a cut tracking' do
    subject { trackings[:cut] }
    it '#available_works?' do
      expect(subject.available_works?).to be true
    end

    it '#available_works' do
      expect(subject.available_works).to be 5
    end

    it '#valid_tracking?' do
      expect(subject.valid_tracking?).to be true
    end

    it '#prev' do
      expect(subject.prev).to be_a(NilTracking)
    end

    it '#next' do
      expect(subject.next).to eq(trackings[:drill])
    end

    it '#cut?' do
      expect(subject.cut?).to be true
    end

    it '#drill?' do
      expect(subject.drill?).to be false
    end

    it '#polish?' do
      expect(subject.polish?).to be false
    end

    it '#temper?' do
      expect(subject.temper?).to be false
    end

    it '#delivery?' do
      expect(subject.delivery?).to be false
    end

    it '#unit_workload' do
      # area = 1 m2 = (1000x1000)
      # stage cut workload = 0.1
      expect(subject.unit_workload).to be 0.1
    end

    it '#perform with no quantity params' do
      expect { subject.perform }.to change { subject.done }.from(0).to(1)
    end

    # available_works => 5
    it '#perform more works than available raise error' do
      expect { subject.perform(6) }.to raise_error { Error::UnavailableWorks }
    end

    it '#perform a cut make drill works available' do
      subject.perform
      expect(trackings[:drill].available_works?).to be true
      expect(trackings[:drill].available_works).to be 1
    end

    it '#perform 3 works' do
      expect { subject.perform(3) }.to change { subject.done }.from(0).to(3)
    end

  end

  context 'for a valid and not ready drill tracking' do
    subject { trackings[:drill] }

    it '#available_works?' do
      expect(subject.available_works?).to be false
    end

    it '#available_works' do
      expect(subject.available_works).to be 0
    end

    it '#valid_tracking?' do
      expect(subject.valid_tracking?).to be true
    end

    it '#prev' do
      expect(subject.prev).to eq(trackings[:cut])
    end

    it '#next' do
      expect(subject.next).to eq(trackings[:polish])
    end

    it '#cut?' do
      expect(subject.cut?).to be false
    end

    it '#drill?' do
      expect(subject.drill?).to be true
    end

    it '#polish?' do
      expect(subject.polish?).to be false
    end

    it '#temper?' do
      expect(subject.temper?).to be false
    end

    it '#delivery?' do
      expect(subject.delivery?).to be false
    end

    it '#unit_workload' do
      # area = 1 m2 = (1000x1000)
      # stage cut workload = 0.15
      expect(subject.unit_workload).to be 0.15
    end

    it '#perform with no quantity params raise error' do
      expect { subject.perform }.to raise_error(Error::UnavailableWorks)
    end

    it '#perform 3 works raise error' do
      expect { subject.perform(3) }.to raise_error(Error::UnavailableWorks)
    end

  end

end
