require 'rails_helper'

RSpec.describe OrdersController, type: :controller do

  before(:each) do
    user = create :user
    sign_in(user)
  end

  let(:product) { create :product }
  let(:polish) { create :polish_type }

  let(:holes_quantity) { 1 }
  let(:tempered) { true }
  let(:quantity) { 1 }
  let(:product_line_description) { 'Product Line Description' }
  let(:width) { 888 }
  let(:height) { 999 }

  let(:product_lines_quantity) { 1 }

  let(:product_lines) do
    pl_array = []
    product_lines_quantity.times do
      pl_array << [id: nil, product_id: product.id, holes_quantity: holes_quantity, polish_type_id: polish.id, tempered: tempered, quantity: quantity, description: product_line_description, width: width, height: height]
    end
    pl_array
  end

  let(:customer) { 'Charlie' }
  let(:description) { 'Order Description' }
  let(:delivery_address) { 'Delivery Address'}
  let(:priority) { '2 - Normal' }
  let(:status) { 'created' }
  let(:order_params) { 
    { customer: customer,
      description: description,
      delivery_address: delivery_address,
      priority: priority,
      status: status,
      product_lines_attributes: product_lines
    } 
  }

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

      it "redirect_to order_path(order)" do
        post :create, params: { order: order_params }
        expect(response).to redirect_to(assigns(:order))
      end

      it "has notice message" do
        post :create, params: { order: order_params }
        expect(flash[:notice]).to be == "Order was successfully created and Order Activation process job was launched."
      end

      it "has status 302" do
        post :create, params: { order: order_params }
        expect(response).to have_http_status(302)
      end
    end

    context 'with a valid Order with many product_lines created' do
      let(:product_lines_quantity) { 2 }

      it "redirect_to order_path(order)" do
        post :create, params: { order: order_params }
        expect(response).to redirect_to(order_path(assigns(:order)))
      end

      it "has notice message" do
        post :create, params: { order: order_params }
        expect(flash[:notice]).to be == "Order was successfully created and Order Activation process job was launched."
      end

      it "has status 302" do
        post :create, params: { order: order_params }
        expect(response).to have_http_status(302)
      end
    end


    context 'with an invalid order' do
      let(:order_params) { attributes_for(:order, :invalid) }
      xit "has alert message" do
        post :create, params: { order: order_params }
        expect { flash[:alert] }.to { eq("Order was not created.") }
      end

      it "has status 500" do
        post :create, params: { order: order_params }
        expect(response).to have_http_status(500)
      end

    end
  end
end
