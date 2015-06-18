json.total_entries @invoices.total_entries
json.current_page @invoices.current_page
json.to_index (@invoices.current_page * @invoices.per_page > @invoices.total_entries) ? @invoices.total_entries : (@invoices.current_page * @invoices.per_page)
previous_page = @invoices.previous_page.present? ? @invoices.previous_page : 0
json.from_index (previous_page * @invoices.per_page)+1

json.invoices @invoices do |invoice|
  json.(invoice, :id, :account_id, :amount, :note, :invtype, :created_at)
  
  json.account invoice.account, :id, :title, :description, :balance
  
  unless invoice.consumption_types.empty?
    json.consumption_types invoice.consumption_types.first, :id, :title, :icon
  end
end
