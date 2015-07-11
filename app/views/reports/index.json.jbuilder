json.array!(@reports) do |report|
  json.extract! report, :id, :company, :period, :revenues
  json.url report_url(report, format: :json)
end
