class StagesController < ApplicationController
  before_action :set_stage, only: [:show, :edit, :update, :destroy]
  
  # GET /stages
  # GET /stages.json
  def index
    @stages = Stage.all
    authorize @stages
  end

  # GET /stages/1
  # GET /stages/1.json
  def show
    @order = Order.find(params[:order_id])
    @stage = Stage.find(params[:id])
    puts "order stage"
    @order_stage = OrderStage.new(@order, @stage)
    puts "cut stage"
    @cut_stage = OrderStage.new(@order, Stage.cut)
    puts "drill stage"
    @drill_stage = OrderStage.new(@order, Stage.drill)
    puts "polish stage"
    @polish_stage = OrderStage.new(@order, Stage.polish)
    puts "temper stage"
    @temper_stage = OrderStage.new(@order, Stage.temper)
    puts "delivery stage"
    @delivery_stage = OrderStage.new(@order, Stage.delivery)
  end

  # GET /stages/new
  def new
    @stage = Stage.new
    authorize @stage
  end

  # GET /stages/1/edit
  def edit
  end

  # POST /stages
  # POST /stages.json
  def create
    @stage = Stage.new(stage_params)

    authorize @stage

    respond_to do |format|
      if @stage.save
        format.html { redirect_to @stage, notice: 'Stage was successfully created.' }
        format.json { render :show, status: :created, location: @stage }
      else
        format.html { render :new }
        format.json { render json: @stage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stages/1
  # PATCH/PUT /stages/1.json
  def update
    respond_to do |format|
      if @stage.update(stage_params)
        format.html { redirect_to @stage, notice: 'Stage was successfully updated.' }
        format.json { render :show, status: :ok, location: @stage }
      else
        format.html { render :edit }
        format.json { render json: @stage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stages/1
  # DELETE /stages/1.json
  def destroy
    @stage.destroy
    respond_to do |format|
      format.html { redirect_to stages_url, notice: 'Stage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_stage
    @stage = Stage.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def stage_params
    params.require(:stage).permit(:name, :workload)
  end
end
