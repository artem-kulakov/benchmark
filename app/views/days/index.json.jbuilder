json.array!(@days) do |day|
  json.extract! day, :id, :day
  json.url day_url(day, format: :json)
end
