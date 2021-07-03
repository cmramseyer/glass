require 'rails_helper'

RSpec.describe OrdersController, type: :controller do

  before(:each) do
    user = create :user
    sign_in(user)
  end

  describe 'GET #index' do
    
    it "renders the in progress page" do
      get :index
      expect(response).to render_template('orders/index')
    end
    
   
  end

  describe 'GET #new' do
    it "renders the in progress page" do
      get :new
      expect(response).to render_template('orders/new')
    end
    
   it "assigns the order" do
     get :new
     expect(assigns(:order)).to be_a_new(Order)
     
   end
  end

  describe "POST #create" do
    
    context 'with a valid Order created' do

      let(:product) { create :product }
      let(:polish) { create :polish_type }

      before(:each) do
        @order_params = {:customer=>"Charlie", :description=>"New Office", :delivery_address=>"Mendoza 2138", :priority=>"2 - Normal", :status=>'created', product_lines_attributes: [id: nil, product_id: product.id, holes_quantity: 1, polish_type_id: polish.id, tempered: true, quantity: 1, description: "Window 1", width: 555, height: 666]}
      end

      it "redirect_to order_path(order)" do
        post :create, params: { order: @order_params }
        expect(response).to redirect_to(assigns(:order))
      end

      it "has notice message" do
        post :create, params: { order: @order_params }
        expect(flash[:notice]).to be == "Order was successfully created and Order Activation process job was launched."
      end

      it "has status 302" do
        post :create, params: { order: @order_params }
        expect(response).to have_http_status(302)
      end
    end


    context 'with a valid Order with nested product_lines created' do
      let(:product) { create :product }
      let(:polish) { create :polish_type }

      before(:each) do
        @order_params = {:customer=>"Charlie", :description=>"New Office", :delivery_address=>"Mendoza 2138", :priority=>"2 - Normal", :status=>'created', product_lines_attributes: [{id: nil, product_id: product.id, holes_quantity: 1, polish_type_id: polish.id, tempered: true, quantity: 1, description: "Window 1", width: 555, height: 666}, {id: nil, product_id: product.id, holes_quantity: 2, polish_type_id: polish.id, tempered: true, quantity: 1, description: "Window 2", width: 777, height: 888}]}
      end
      
      
      it "redirect_to order_path(order)" do
        post :create, params: { order: @order_params }
        expect(response).to redirect_to(order_path(assigns(:order)))
      end

      it "has notice message" do
        post :create, params: { order: @order_params }
        expect(flash[:notice]).to be == "Order was successfully created and Order Activation process job was launched."
      end

      it "has status 302" do
        post :create, params: { order: @order_params }
        expect(response).to have_http_status(302)
      end
    end

    

    context 'with an invalid order' do

      let(:order_params) { attributes_for(:order, :invalid) }

      it "has alert message" do
        post :create, params: { order: order_params }
        expect(flash[:alert]).to be == "Order was not created."
      end

      it "has status 500" do
        post :create, params: { order: order_params }
        expect(response).to have_http_status(500)
      end

    end

  end

end
