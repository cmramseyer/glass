require 'rails_helper'

RSpec.describe Utility::TrackingGenerator, type: :model do

  
  context 'with an order with one product line, No Drill, Polish Type None, and NO temper ' do

    
    let(:order) {product_lines(:product_line_cd).order}

    it 'generates right tracking' do
      utility = Utility::TrackingGenerator.new(order).run
      tracking = utility.tracking_created[0]

      expect(tracking.stage).to be Stage.cut

      expect(tracking.
        next_tracking.stage).to be Stage.delivery
    end
  end

  context 'with an order with one product line, Drill, Polish Type None, and NO temper ' do

    let(:product_line) { create :product_line, :drill_no_polish_no_temper }
    let(:order) {Order.new}

    it 'generates right tracking stages' do
      order.product_lines << product_line
      utility = Utility::TrackingGenerator.new(order).run
      tracking = utility.tracking_created[0]

      expect(tracking.stage).to be Stage.cut

      expect(tracking.
        next_tracking.stage).to be Stage.drill

      expect(tracking.
        next_tracking.
        next_tracking.stage).to be Stage.delivery
    end

    it 'generates valid trackings' do
      order.product_lines << product_line
      utility = Utility::TrackingGenerator.new(order).run
      tracking = utility.tracking_created[0]

      expect(tracking.stage).to be_valid

      expect(tracking.
        next_tracking.stage).to be_valid

      expect(tracking.
        next_tracking.
        next_tracking.stage).to be_valid
    end
  end

  context 'with an order with one product line, Drill, Polish Type Flat, and NO temper ' do

    let(:product_line) { create :product_line, :drill_polish_no_temper }
    let(:order) {Order.new}

    it 'generates right tracking stages' do
      order.product_lines << product_line
      utility = Utility::TrackingGenerator.new(order).run
      tracking = utility.tracking_created[0]

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

    it 'generates valid trackings' do
      order.product_lines << product_line
      utility = Utility::TrackingGenerator.new(order).run
      tracking = utility.tracking_created[0]

      expect(tracking.stage).to be_valid

      expect(tracking.
        next_tracking.stage).to be_valid

      expect(tracking.
        next_tracking.
        next_tracking.stage).to be_valid

      expect(tracking.
        next_tracking.
        next_tracking.
        next_tracking.stage).to be_valid
    end
  end

  context 'with an order with one product line, Drill, Polish Type Flat, and  temper ' do

    let(:product_line) { create :product_line, :drill_polish_temper }
    let(:order) {Order.new}

    it 'generates right tracking stages' do
      order.product_lines << product_line
      utility = Utility::TrackingGenerator.new(order).run
      tracking = utility.tracking_created[0]

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

    it 'generates valid trackings' do
      order.product_lines << product_line
      utility = Utility::TrackingGenerator.new(order).run
      tracking = utility.tracking_created[0]

      expect(tracking.stage).to be_valid

      expect(tracking.
        next_tracking.stage).to be_valid

      expect(tracking.
        next_tracking.
        next_tracking.stage).to be_valid

      expect(tracking.
        next_tracking.
        next_tracking.
        next_tracking.stage).to be_valid

      expect(tracking.
        next_tracking.
        next_tracking.
        next_tracking.
        next_tracking.stage).to be_valid
    end
  end

  context 'with an order with one product line, Drill, No Polish Type, and  temper ' do

    let(:product_line) { create :product_line, :drill_no_polish_temper }
    let(:order) {Order.new}

    it 'generates right tracking stages' do
      order.product_lines << product_line
      utility = Utility::TrackingGenerator.new(order).run
      tracking = utility.tracking_created[0]

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

    it 'generates valid trackings' do
      order.product_lines << product_line
      utility = Utility::TrackingGenerator.new(order).run
      tracking = utility.tracking_created[0]

      expect(tracking.stage).to be_valid

      expect(tracking.
        next_tracking.stage).to be_valid

      expect(tracking.
        next_tracking.
        next_tracking.stage).to be_valid

      expect(tracking.
        next_tracking.
        next_tracking.
        next_tracking.stage).to be_valid

    end
  end

  context 'with an order with one product line, No Drill, No Polish Type, and  temper ' do

    let(:product_line) { create :product_line, :no_drill_no_polish_temper }
    let(:order) {Order.new}

    it 'generates right tracking stages' do
      order.product_lines << product_line
      utility = Utility::TrackingGenerator.new(order).run
      tracking = utility.tracking_created[0]

      expect(tracking.stage).to be Stage.cut

      expect(tracking.
        next_tracking.stage).to be Stage.temper

      expect(tracking.
        next_tracking.
        next_tracking.stage).to be Stage.delivery

    end

    it 'generates valid trackings' do
      order.product_lines << product_line
      utility = Utility::TrackingGenerator.new(order).run
      tracking = utility.tracking_created[0]

      expect(tracking.stage).to be_valid

      expect(tracking.
        next_tracking.stage).to be_valid

      expect(tracking.
        next_tracking.
        next_tracking.stage).to be_valid

    end
  end



  # im gonna test only one order with two product lines
  context 'with an order with two product lines, the first Drill, No Polish Type, and  temper, the second No Drill, Polish Flat and no Temper ' do

    let(:product_line_one) { create :product_line, :drill_no_polish_temper }
    let(:product_line_two) { create :product_line, :no_drill_polish_no_temper }
    let(:order) {Order.new}

    it 'generates right tracking stages' do
      order.product_lines << product_line_one << product_line_two
      utility = Utility::TrackingGenerator.new(order).run

      tracking_one = utility.tracking_created[0]

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

      tracking_two = utility.tracking_created[1]

      expect(tracking_two.stage).to be Stage.cut

      expect(tracking_two.
        next_tracking.stage).to be Stage.polish

      expect(tracking_two.
        next_tracking.
        next_tracking.stage).to be Stage.delivery

    end

    it 'generates valid trackings' do
      order.product_lines << product_line_one << product_line_two
      utility = Utility::TrackingGenerator.new(order).run

      tracking_one = utility.tracking_created[0]

      expect(tracking_one.stage).to be_valid

      expect(tracking_one.
        next_tracking.stage).to be_valid

      expect(tracking_one.
        next_tracking.
        next_tracking.stage).to be_valid

      expect(tracking_one.
        next_tracking.
        next_tracking.
        next_tracking.stage).to be_valid

      tracking_two = utility.tracking_created[1]

      expect(tracking_two.stage).to be_valid

      expect(tracking_two.
        next_tracking.stage).to be_valid

      expect(tracking_two.
        next_tracking.
        next_tracking.stage).to be_valid

    end
  end


end
