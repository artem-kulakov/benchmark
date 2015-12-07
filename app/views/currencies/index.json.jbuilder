json.array!(@currencies) do |currency|
  json.extract! currency, :id, :code, :title
  json.url currency_url(currency, format: :json)
end
