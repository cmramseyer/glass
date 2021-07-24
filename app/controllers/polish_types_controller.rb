class PolishTypesController < ApplicationController
  before_action :set_polish_type, only: [:show, :edit, :update, :destroy]

  # GET /polish_types
  # GET /polish_types.json
  def index
    @polish_types = PolishType.all
  end

  # GET /polish_types/1
  # GET /polish_types/1.json
  def show
  end

  # GET /polish_types/new
  def new
    @polish_type = PolishType.new
  end

  # GET /polish_types/1/edit
  def edit
  end

  # POST /polish_types
  # POST /polish_types.json
  def create
    @polish_type = PolishType.new(polish_type_params)

    respond_to do |format|
      if @polish_type.save
        format.html { redirect_to @polish_type, notice: 'Polish type was successfully created.' }
        format.json { render :show, status: :created, location: @polish_type }
      else
        format.html { render :new }
        format.json { render json: @polish_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /polish_types/1
  # PATCH/PUT /polish_types/1.json
  def update
    respond_to do |format|
      if @polish_type.update(polish_type_params)
        format.html { redirect_to @polish_type, notice: 'Polish type was successfully updated.' }
        format.json { render :show, status: :ok, location: @polish_type }
      else
        format.html { render :edit }
        format.json { render json: @polish_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /polish_types/1
  # DELETE /polish_types/1.json
  def destroy
    @polish_type.destroy
    respond_to do |format|
      format.html { redirect_to polish_types_url, notice: 'Polish type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_polish_type
    @polish_type = PolishType.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def polish_type_params
    params.require(:polish_type).permit(:name)
  end
end
