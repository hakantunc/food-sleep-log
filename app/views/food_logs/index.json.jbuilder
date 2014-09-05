json.array!(@food_logs) do |food_log|
  json.extract! food_log, :id, :date, :morning, :afternoon, :evening, :night
  json.url food_log_url(food_log, format: :json)
end
