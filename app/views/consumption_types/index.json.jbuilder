json.array!(@consumption_types) do |consumption_type|
  json.extract! consumption_type, :id, :title, :user_id
  json.url consumption_type_url(consumption_type, format: :json)
end
