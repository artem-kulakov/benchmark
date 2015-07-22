json.array!(@companies) do |company|
  json.extract! company, :id, :title, :industry_id
  json.url company_url(company, format: :json)
end
