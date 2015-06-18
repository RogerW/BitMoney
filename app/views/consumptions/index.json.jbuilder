json.array!(@consumptions) do |consumption|
  json.extract! consumption, :id, :invoice_id, :consumption_type_id
end
