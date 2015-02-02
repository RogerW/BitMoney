json.array!(@consumptions) do |consumption|
  json.extract! consumption, :id, :invoice_id, :consumption_type_id
  json.url consumption_url(consumption, format: :json)
end
