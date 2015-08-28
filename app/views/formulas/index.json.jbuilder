json.array!(@formulas) do |formula|
  json.extract! formula, :id, :indicator_id, :formula
  json.url formula_url(formula, format: :json)
end
