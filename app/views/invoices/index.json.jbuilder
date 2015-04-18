json.array!(@invoices) do |invoice|
  json.extract! invoice, :id, :account_id, :amount, :note, :invtype, :created_at
  if invoice.consumptions
    json.consumption_types invoice.consumption_types, :id
  end
  
end
