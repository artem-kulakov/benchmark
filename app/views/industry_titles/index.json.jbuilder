json.array!(@industry_titles) do |industry_title|
  json.extract! industry_title, :id, :title, :industry_id, :user_id
  json.url industry_title_url(industry_title, format: :json)
end
