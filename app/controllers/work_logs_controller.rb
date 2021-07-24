class WorkLogsController < ApplicationController
  before_action :set_work_log, only: [:show, :edit, :update, :destroy]

  # GET /work_logs
  # GET /work_logs.json
  def index
    @work_logs = WorkLog.all
  end

  # GET /work_logs/1
  # GET /work_logs/1.json
  def show
  end

  # GET /work_logs/new
  def new
    @work_log = WorkLog.new
  end

  # GET /work_logs/1/edit
  def edit
  end

  # POST /work_logs
  # POST /work_logs.json
  def create
    @work_log = WorkLog.new(work_log_params)

    respond_to do |format|
      if @work_log.save
        format.html { redirect_to @work_log, notice: 'Work log was successfully created.' }
        format.json { render :show, status: :created, location: @work_log }
      else
        format.html { render :new }
        format.json { render json: @work_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /work_logs/1
  # PATCH/PUT /work_logs/1.json
  def update
    respond_to do |format|
      if @work_log.update(work_log_params)
        format.html { redirect_to @work_log, notice: 'Work log was successfully updated.' }
        format.json { render :show, status: :ok, location: @work_log }
      else
        format.html { render :edit }
        format.json { render json: @work_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_logs/1
  # DELETE /work_logs/1.json
  def destroy
    @work_log.destroy
    respond_to do |format|
      format.html { redirect_to work_logs_url, notice: 'Work log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_work_log
    @work_log = WorkLog.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def work_log_params
    params.require(:work_log).permit(:tracking_id, :user_id)
  end
end
