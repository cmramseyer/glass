require 'rails_helper'

RSpec.describe PerformWorkController, type: :controller do

  before(:each) do
    user = users(:admin)
    sign_in(user)
  end

  describe 'POST #create' do
    
    let(:track) { trackings(:track_102) }

    context "when tracking has available_works" do

      it "renders the success message" do
        post :create, params: { tracking_id: track.id }
        expect(response).to redirect_to(order_stage_path(order_id: assigns(:order).id, id: assigns(:stage).id))
      end

      it "has status 200" do
        post :create, params: { tracking_id: track.id }
        expect(response).to have_http_status(302)
      end

      
    end

    context 'when tracking has not available_works' do
      
      let(:track) { trackings(:track_002) }
      
      it "redirect_to order_stage " do
        post :create, params: { tracking_id: track.id }

        expect(response).to redirect_to(order_stage_path(order_id: assigns(:order).id, id: assigns(:stage).id))
      end

      it "has status 422" do
        post :create, params: { tracking_id: track.id }
        expect(response).to have_http_status(302)
      end

    end    
   
  end

  
end
