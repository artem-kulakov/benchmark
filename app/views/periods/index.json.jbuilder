json.array!(@periods) do |period|
  json.extract! period, :id, :title
  json.url period_url(period, format: :json)
end
