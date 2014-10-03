class FoodLogsController < ApplicationController
  before_action :set_food_log, only: [:show, :edit, :update, :destroy]

  # GET /food_logs
  # GET /food_logs.json
  def index
    @food_logs = FoodLog.order(:date).reverse_order
  end

  # GET /food_logs/1
  # GET /food_logs/1.json
  def show
  end

  # GET /food_logs/new
  def new
    @food_log = FoodLog.new
  end

  # GET /food_logs/1/edit
  def edit
  end

  # POST /food_logs
  # POST /food_logs.json
  def create
    @food_log = FoodLog.new(food_log_params)

    respond_to do |format|
      if @food_log.save
        format.html { redirect_to root_path, notice: 'Food log was successfully created.' }
        format.json { render :show, status: :created, location: @food_log }
      else
        format.html { render :new }
        format.json { render json: @food_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /food_logs/1
  # PATCH/PUT /food_logs/1.json
  def update
    respond_to do |format|
      if @food_log.update(food_log_params)
        format.html { redirect_to root_path, notice: 'Food log was successfully updated.' }
        format.json { render :show, status: :ok, location: @food_log }
      else
        format.html { render :edit }
        format.json { render json: @food_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_logs/1
  # DELETE /food_logs/1.json
  def destroy
    @food_log.destroy
    respond_to do |format|
      format.html { redirect_to food_logs_url, notice: 'Food log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_log
      @food_log = FoodLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_log_params
      params.require(:food_log).permit(:date, :morning, :afternoon, :evening, :night)
    end
end
