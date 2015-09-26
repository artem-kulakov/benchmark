json.array!(@versions) do |version|
  json.extract! version, :id, :report_id, :user_id
  json.url version_url(version, format: :json)
end
