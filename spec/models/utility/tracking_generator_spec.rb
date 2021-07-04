require 'rails_helper'

RSpec.describe Utility::TrackingGenerator, type: :model do

  let(:order) do 
    an_order = build :order
    an_order.product_lines = product_lines
    an_order.save
    an_order
  end

  let!(:cut_stage) { create :stage, :cut }
  let!(:drill_stage) { create :stage, :drill }
  let!(:polish_stage) { create :stage, :polish }
  let!(:temper_stage) { create :stage, :temper }
  let!(:delivery_stage) { create :stage, :delivery }

  let(:polish_type) { create :polish_type, name: polish_name }
  let(:product) { create :product }
  let(:product_line) { build :product_line, product: product, holes_quantity: holes_quantity, polish_type: polish_type, tempered: tempered }

  let(:product_lines) { [product_line] }

  subject { Utility::TrackingGenerator.new(order).run }

  context 'with an order with one product line, No Drill, Polish Type None, and NO temper' do

    let(:polish_name) { 'None' }
    let(:holes_quantity) { 0 }
    let(:tempered) { false }

    it 'generates right tracking' do
      tracking = subject.tracking_created[0]
      expect(tracking.stage_name).to eq('Cut')
      expect(tracking.next_tracking.stage_name).to eq('Delivery')
    end
  end

  context 'with an order with one product line, Drill, Polish Type None, and NO temper ' do
    let(:polish_name) { 'None' }
    let(:holes_quantity) { 1 }
    let(:tempered) { false }
    it 'generates right tracking stages' do
      tracking = subject.tracking_created[0]
      expect(tracking.stage).to be Stage.cut
      expect(tracking.
        next_tracking.stage).to be Stage.drill
      expect(tracking.
        next_tracking.
        next_tracking.stage).to be Stage.delivery
    end
  end

  context 'with an order with one product line, Drill, Polish Type Flat, and NO temper ' do

    let(:polish_name) { 'Flat Polish' }
    let(:holes_quantity) { 1 }
    let(:tempered) { false }

    it 'generates right tracking stages' do
      tracking = subject.tracking_created[0]

      expect(tracking.stage).to be Stage.cut

      expect(tracking.
        next_tracking.stage).to be Stage.drill

      expect(tracking.
        next_tracking.
        next_tracking.stage).to be Stage.polish

      expect(tracking.
        next_tracking.
        next_tracking.
        next_tracking.stage).to be Stage.delivery
    end
  end

  context 'with an order with one product line, Drill, Polish Type Flat, and  temper ' do

    let(:polish_name) { 'Flat Polish' }
    let(:holes_quantity) { 1 }
    let(:tempered) { true }

    it 'generates right tracking stages' do
      tracking = subject.tracking_created[0]

      expect(tracking.stage).to be Stage.cut

      expect(tracking.
        next_tracking.stage).to be Stage.drill

      expect(tracking.
        next_tracking.
        next_tracking.stage).to be Stage.polish

      expect(tracking.
        next_tracking.
        next_tracking.
        next_tracking.stage).to be Stage.temper

      expect(tracking.
        next_tracking.
        next_tracking.
        next_tracking.
        next_tracking.stage).to be Stage.delivery
    end
  end

  context 'with an order with one product line, Drill, No Polish Type, and  temper ' do

    let(:polish_name) { 'None' }
    let(:holes_quantity) { 1 }
    let(:tempered) { true }

    it 'generates right tracking stages' do
      tracking = subject.tracking_created[0]

      expect(tracking.stage).to be Stage.cut

      expect(tracking.
        next_tracking.stage).to be Stage.drill

      expect(tracking.
        next_tracking.
        next_tracking.stage).to be Stage.temper

      expect(tracking.
        next_tracking.
        next_tracking.
        next_tracking.stage).to be Stage.delivery

    end
  end

  context 'with an order with one product line, No Drill, No Polish Type, and  temper ' do

    let(:polish_name) { 'None' }
    let(:holes_quantity) { 0 }
    let(:tempered) { true }

    it 'generates right tracking stages' do
      tracking = subject.tracking_created[0]

      expect(tracking.stage).to be Stage.cut

      expect(tracking.
        next_tracking.stage).to be Stage.temper

      expect(tracking.
        next_tracking.
        next_tracking.stage).to be Stage.delivery

    end
  end

  # im gonna test only one order with two product lines
  context 'with an order with two product lines, the first Drill, No Polish Type, and  temper, the second No Drill, Polish Flat and no Temper ' do

    let(:polish_name) { 'None' }
    let(:holes_quantity) { 1 }
    let(:tempered) { true }

    let(:polish_name_2) { 'Flat Polish' }
    let(:holes_quantity_2) { 0 }
    let(:tempered_2) { false }

    let(:polish_type_2) { create :polish_type, name: polish_name_2 }
    let(:product_2) { create :product, name: 'Float 8mm. Clear', code: 'FL8CLE' }
    let(:product_line_2) { create :product_line, product: product_2, holes_quantity: holes_quantity_2, polish_type: polish_type_2, tempered: tempered_2 }

    let(:product_lines) { [product_line, product_line_2] }

    it 'generates right tracking stages' do
      tracking_one = subject.tracking_created[0]

      expect(tracking_one.stage).to be Stage.cut

      expect(tracking_one.
        next_tracking.stage).to be Stage.drill

      expect(tracking_one.
        next_tracking.
        next_tracking.stage).to be Stage.temper

      expect(tracking_one.
        next_tracking.
        next_tracking.
        next_tracking.stage).to be Stage.delivery

      tracking_two = subject.tracking_created[1]

      expect(tracking_two.stage).to be Stage.cut

      expect(tracking_two.
        next_tracking.stage).to be Stage.polish

      expect(tracking_two.
        next_tracking.
        next_tracking.stage).to be Stage.delivery

    end
  end
end
