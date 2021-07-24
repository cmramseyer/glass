require 'rails_helper'

RSpec.describe ProgramsController, type: :controller do

  before(:each) do
    user = create :user
    sign_in(user)
  end

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
  let!(:program) { create :program, name: program_name }
  let(:product_lines) { [product_line] }

  let(:delivery_track) { build :tracking, stage: delivery_stage, product_line: product_line }
  let(:cut_track) { build :tracking, stage: cut_stage, product_line: product_line }
  let!(:trackings) { create_trackings(cut_track, delivery_track) }


  describe 'GET #index' do

    it "renders the in progress page" do
      get :index
      expect(response).to render_template('programs/index')
    end

    it "assigns @programs" do
      get :index
      expect(assigns(:programs).length).to be == 1
    end

  end

  describe 'GET #new' do
    it "renders the in progress page" do
      get :new
      expect(response).to render_template('programs/new')
    end
    it "assigns new program" do
      get :new
      expect(assigns(:program)).to be_a_new(Program)
    end

    it "assigns new available_cuts" do
      get :new
      expect(assigns(:available_cuts).to_a).to eq([trackings[:cut]])
    end
  end

  describe "POST #create" do
  end

end
