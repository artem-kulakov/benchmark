json.array!(@gaaps) do |gaap|
  json.extract! gaap, :id, :title
  json.url gaap_url(gaap, format: :json)
end
