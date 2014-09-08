require 'test_helper'

class SleepLogsControllerTest < ActionController::TestCase
  setup do
    @sleep_log = sleep_logs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sleep_logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sleep_log" do
    assert_difference('SleepLog.count') do
      post :create, sleep_log: { date: @sleep_log.date, sleep: @sleep_log.sleep, wake_up: @sleep_log.wake_up }
    end

    assert_redirected_to sleep_log_path(assigns(:sleep_log))
  end

  test "should show sleep_log" do
    get :show, id: @sleep_log
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sleep_log
    assert_response :success
  end

  test "should update sleep_log" do
    patch :update, id: @sleep_log, sleep_log: { date: @sleep_log.date, sleep: @sleep_log.sleep, wake_up: @sleep_log.wake_up }
    assert_redirected_to sleep_log_path(assigns(:sleep_log))
  end

  test "should destroy sleep_log" do
    assert_difference('SleepLog.count', -1) do
      delete :destroy, id: @sleep_log
    end

    assert_redirected_to sleep_logs_path
  end
end
