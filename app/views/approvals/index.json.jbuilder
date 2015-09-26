json.array!(@approvals) do |approval|
  json.extract! approval, :id, :version_id, :user_id
  json.url approval_url(approval, format: :json)
end
