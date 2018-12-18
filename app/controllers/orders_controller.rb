class OrdersController < ApplicationController

  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index

    orders = Order.all
    @rows = orders.map do |order| 
      OpenStruct.new(
        order: order,
        cut: OrderStage.new(order, Stage.cut),
        drill: OrderStage.new(order, Stage.drill),
        polish: OrderStage.new(order, Stage.polish),
        temper: OrderStage.new(order, Stage.temper),
        delivery: OrderStage.new(order, Stage.delivery)
      )
    end

  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @cut_stage = OrderStage.new(@order, Stage.cut)
    @drill_stage = OrderStage.new(@order, Stage.drill)
    @polish_stage = OrderStage.new(@order, Stage.polish)
    @temper_stage = OrderStage.new(@order, Stage.temper)
    @delivery_stage = OrderStage.new(@order, Stage.delivery)
    @stage = nil
  end

  # GET /orders/new
  def new
    @order = Order.new
    @order.product_lines.build
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    # @order = Order.new(order_params)
    @order = Order.new(order_params)

    @order = Service::FullOrderActivation.new(@order, current_user).run

    flash[:notice] = 'Order was successfully created and Order Activation process job were launched.'
    redirect_to @order, status: '302'

  rescue StandardError => e
    flash[:alert] = 'Order was not created.'
    render :new, status: '500'
  rescue Exception => e
    flash[:alert] = 'Unexpected error.'
    render :new, status: '500'
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:id, :customer, :description, :priority, :delivery_address, :status, product_lines_attributes: [:id, :_destroy, :product_id, :order_id, :holes_quantity, :polish_type_id, :tempered, :quantity, :description, :width, :height])
    end
end
