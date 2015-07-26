json.array!(@industry_indicators) do |industry_indicator|
  json.extract! industry_indicator, :id, :industry_id, :indicator_id
  json.url industry_indicator_url(industry_indicator, format: :json)
end
