require 'rails_helper'

RSpec.describe Utility::CheckProgram, type: :model do

  def create_trackings(cut_track, delivery_track)
    delivery_track.prev_tracking = cut_track
    cut_track.next_tracking = delivery_track

    delivery_track.save
    cut_track.save
    { cut: cut_track, delivery: delivery_track }
  end

  let(:order) do 
    an_order = build :order
    an_order.product_lines = product_lines
    an_order.save
    an_order
  end

  let!(:cut_stage) { create :stage, :cut }
  let!(:delivery_stage) { create :stage, :delivery }

  let(:polish_type) { create :polish_type, name: polish_name }
  let(:product) { create :product }
  let(:polish_name) { 'None' }
  let(:holes_quantity) { 0 }
  let(:tempered) { false }

  let(:product_line) { build :product_line, product: product, holes_quantity: holes_quantity, polish_type: polish_type, tempered: tempered }

  let(:program_name) { 'AAA001' }
  let(:program) { create :program, name: program_name }
  let(:product_lines) { [product_line] }

  let(:delivery_track) { build :tracking, stage: delivery_stage, product_line: product_line }
  let(:cut_track) { build :tracking, stage: cut_stage, product_line: product_line }
  let!(:trackings) { create_trackings(cut_track, delivery_track) }
  let!(:cut) { create :cut, program: program, order: order, tracking: trackings[:cut] }

  context 'when programs AAA001 is stored' do

    it "new program called AAA002 is allowed" do
      expect(Utility::CheckProgram.name_uniqueness("AAA002")).to be_nil
    end
    it "new program called AAA001 is not allowed" do
      expect {Utility::CheckProgram.name_uniqueness("AAA001")}.to raise_error(Error::CutMachineProgram)
    end
    it "new program with blank name is not allowed" do
      expect {Utility::CheckProgram.name_uniqueness(" ")}.to raise_error(Error::CutMachineProgram)
    end
  end

  context 'when product Float 4mm. Clear with code FL4CLE is stored' do
    it "new program with product code FL4CLE is allowed" do
      expect(Utility::CheckProgram.product_existence("FL4CLE")).to be_nil
    end
    it "new program with product code FL3BLK is not allowed" do
      expect {Utility::CheckProgram.product_existence("FL3BLK")}.to raise_error(Error::CutMachineProgram)
    end
  end
end
