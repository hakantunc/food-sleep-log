json.array!(@sleep_logs) do |sleep_log|
  json.extract! sleep_log, :id, :date, :sleep, :wake_up
  json.url sleep_log_url(sleep_log, format: :json)
end
