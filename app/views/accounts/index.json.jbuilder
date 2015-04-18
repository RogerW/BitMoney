json.array! @accounts do |account|
  json.(account, :title, :description, :created_at, :updated_at, :is_default, :id)
  json.balance account.balance
end
