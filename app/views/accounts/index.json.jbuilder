json.array! @accounts do |account|
  json.(account, :title, :description, :created_at, :updated_at, :is_default)
  json.balance humanized_money_with_symbol(account.balance)
end
