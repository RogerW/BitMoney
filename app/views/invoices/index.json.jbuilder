json.array!(@invoices) do |invoice|
  json.extract! invoice, :id, :account_id, :amount, :note
  json.url invoice_url(invoice, format: :json)
end
