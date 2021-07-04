require 'rails_helper'

RSpec.describe PerformWorkController, type: :controller do

  before(:each) do
    user = create :user
    sign_in(user)
  end

  def create_trackings(cut_track, drill_track, temper_track, delivery_track)
    delivery_track.prev_tracking = temper_track

    temper_track.next_tracking = delivery_track
    temper_track.prev_tracking = drill_track
    
    drill_track.next_tracking = temper_track
    drill_track.prev_tracking = cut_track

    cut_track.next_tracking = drill_track

    delivery_track.save
    temper_track.save
    drill_track.save
    cut_track.save
    { cut: cut_track, drill: drill_track, temper: temper_track, delivery: delivery_track }
  end

  let!(:order) do 
    an_order = build :order
    an_order.product_lines = [product_line]
    an_order.save
    an_order
  end

  let!(:trackings) { create_trackings(cut_track, drill_track, temper_track, delivery_track) }

  let(:user) { create :user }
  let(:quantity) { 5 }
  let(:product_line) { create :product_line, quantity: quantity, width: 1000, height: 1000 }
  let(:program) {create :program, user: user, product: product_line.product }

  let(:cut_stage) { create :stage, :cut, workload: 0.1 }
  let(:drill_stage) { create :stage, :drill, workload: 0.15 }
  let(:temper_stage) { create :stage, :temper, workload: 1.5 }
  let(:delivery_stage) { create :stage, :delivery, workload: 0.3 }
  let(:cut) { create :cut, program: program }

  let(:delivery_track) { build :tracking, stage: delivery_stage, product_line: product_line }
  let(:temper_track) { build :tracking, stage: temper_stage, product_line: product_line }
  let(:drill_track) { build :tracking, stage: drill_stage, product_line: product_line }
  let(:cut_track) { build :tracking, stage: cut_stage, product_line: product_line }

  describe 'POST #create' do

    subject { cut_track }

    context "when tracking has available_works" do

      it "renders the success message" do
        post :create, params: { tracking_id: subject.id }
        expect(response).to redirect_to(order_stage_path(order_id: assigns(:order).id, id: assigns(:stage).id))
      end

      it "has status 200" do
        post :create, params: { tracking_id: subject.id }
        expect(response).to have_http_status(302)
      end

    end

    context 'when tracking has not available_works' do

      subject { drill_track }

      it "redirect_to order_stage " do
        post :create, params: { tracking_id: subject.id }
        expect(response).to redirect_to(order_stage_path(order_id: assigns(:order).id, id: assigns(:stage).id))
      end

      it "has status 422" do
        post :create, params: { tracking_id: subject.id }
        expect(response).to have_http_status(302)
      end
    end
  end
end
