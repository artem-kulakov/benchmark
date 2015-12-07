json.array!(@fx_rates) do |fx_rate|
  json.extract! fx_rate, :id, :day_id, :currency_id, :rate
  json.url fx_rate_url(fx_rate, format: :json)
end
