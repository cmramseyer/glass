require 'rails_helper'

RSpec.describe ActivationController, type: :controller do

  before(:each) do
    user = create :user
    sign_in(user)
  end

  let(:order) { create :order, product_lines: [product_line] }
  let(:product_line) { create :product_line }

  describe 'POST #create' do
    it "renders the success message" do
      allow(Service::OrderActivation).to receive_message_chain(:new, :run).and_return(nil)
      post :create, xhr: true, params: { order_id: order.id }
      expect(response).to render_template 'general/success_notification'
    end
  end

end
