json.array!(@industries) do |industry|
  json.extract! industry, :id, :title
  json.url industry_url(industry, format: :json)
end
