class ProductLinesController < ApplicationController
  before_action :set_product_line, only: [:show, :edit, :update, :destroy]

  # GET /product_lines
  # GET /product_lines.json
  def index
    @product_lines = ProductLine.all
  end

  # GET /product_lines/1
  # GET /product_lines/1.json
  def show
  end

  # GET /product_lines/new
  def new
    @product_line = ProductLine.new
  end

  # GET /product_lines/1/edit
  def edit
  end

  # POST /product_lines
  # POST /product_lines.json
  def create
    @product_line = ProductLine.new(product_line_params)

    respond_to do |format|
      if @product_line.save
        format.html { redirect_to @product_line, notice: 'Product line was successfully created.' }
        format.json { render :show, status: :created, location: @product_line }
      else
        format.html { render :new }
        format.json { render json: @product_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_lines/1
  # PATCH/PUT /product_lines/1.json
  def update
    respond_to do |format|
      if @product_line.update(product_line_params)
        format.html { redirect_to @product_line, notice: 'Product line was successfully updated.' }
        format.json { render :show, status: :ok, location: @product_line }
      else
        format.html { render :edit }
        format.json { render json: @product_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_lines/1
  # DELETE /product_lines/1.json
  def destroy
    @product_line.destroy
    respond_to do |format|
      format.html { redirect_to product_lines_url, notice: 'Product line was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product_line
    @product_line = ProductLine.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_line_params
    params.require(:product_line).permit(:product_id, :order_id, :holes_quantity, :polish_type_id, :tempered, :quantity, :description, :width, :height)
  end
end
