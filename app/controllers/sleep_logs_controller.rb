class SleepLogsController < ApplicationController
  before_action :set_sleep_log, only: [:show, :edit, :update, :destroy]

  # GET /sleep_logs
  # GET /sleep_logs.json
  def index
    def from_midnight(time)
      from_midnight_val = time - time.midnight
      from_midnight_val = from_midnight_val - 86400 if from_midnight_val > 43200
      return from_midnight_val
    end

    @sleep_logs = SleepLog.order(:date).reverse_order
    total_sleep = 0
    total_wakeup = 0
    total_average = 0
    @sleep_logs.each do |sleep_log|
      total_sleep = total_sleep + from_midnight(sleep_log.sleep)
      total_wakeup = total_wakeup + from_midnight(sleep_log.wake_up)
      total_average = total_average + (sleep_log.wake_up - sleep_log.sleep)
    end
    if @sleep_logs.count > 0
      ts = total_sleep / @sleep_logs.count
      ts = 86400 + ts if ts < 0
      sh = ts.to_i/60/60
      sm = ts.to_i/60%60
      @average_sleep = %%#{sh.to_s.rjust 2, '0'}:#{sm.to_s.rjust 2, '0'}%
    else
      @average_sleep = %%-%
    end
    if @sleep_logs.count > 0
      ts = total_wakeup / @sleep_logs.count
      ts = 86400 + ts if ts < 0
      sh = ts.to_i/60/60
      sm = ts.to_i/60%60
      @average_wakeup = %%#{sh.to_s.rjust 2, '0'}:#{sm.to_s.rjust 2, '0'}%
    else
      @average_wakeup = %%-%
    end

    if @sleep_logs.count > 0
      ts = total_average / @sleep_logs.count
      @average_sleep_duration = %%#{ts.to_i / 60 / 60} hours #{ts.to_i / 60 % 60} mins%
    else
      @average_sleep_duration = %%-%
    end

  end

  # GET /sleep_logs/1
  # GET /sleep_logs/1.json
  def show
  end

  # GET /sleep_logs/new
  def new
    @sleep_log = SleepLog.new
  end

  # GET /sleep_logs/1/edit
  def edit
  end

  # POST /sleep_logs
  # POST /sleep_logs.json
  def create
    @sleep_log = SleepLog.new(sleep_log_params)

    respond_to do |format|
      if @sleep_log.save
        format.html { redirect_to sleep_logs_path, notice: 'Sleep log was successfully created.' }
        format.json { render :show, status: :created, location: @sleep_log }
      else
        format.html { render :new }
        format.json { render json: @sleep_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sleep_logs/1
  # PATCH/PUT /sleep_logs/1.json
  def update
    respond_to do |format|
      if @sleep_log.update(sleep_log_params)
        format.html { redirect_to sleep_logs_path, notice: 'Sleep log was successfully updated.' }
        format.json { render :show, status: :ok, location: @sleep_log }
      else
        format.html { render :edit }
        format.json { render json: @sleep_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sleep_logs/1
  # DELETE /sleep_logs/1.json
  def destroy
    @sleep_log.destroy
    respond_to do |format|
      format.html { redirect_to sleep_logs_url, notice: 'Sleep log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sleep_log
      @sleep_log = SleepLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sleep_log_params
      params.require(:sleep_log).permit(:date, :sleep, :wake_up)
    end
end
