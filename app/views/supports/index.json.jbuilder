json.array!(@supports) do |support|
  json.extract! support, :id, :email, :description
  json.url support_url(support, format: :json)
end
