require 'rails_helper'

RSpec.describe ProgramsController, type: :controller do

  before(:each) do
    user = users(:admin)
    sign_in(user)
  end

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
     expect(assigns(:available_cuts).to_a).to eq([trackings(:track_001)])
   end
  end

  describe "POST #create" do


  end

end

