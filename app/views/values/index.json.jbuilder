json.array!(@values) do |value|
  json.extract! value, :id, :indicator_id, :report_id, :value
  json.url value_url(value, format: :json)
end
