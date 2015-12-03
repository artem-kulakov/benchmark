json.array!(@accounting_standards) do |accounting_standard|
  json.extract! accounting_standard, :id, :title
  json.url accounting_standard_url(accounting_standard, format: :json)
end
