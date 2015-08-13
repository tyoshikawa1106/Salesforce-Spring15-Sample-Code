json.array!(@users) do |user|
  json.extract! user, :id, :name, :score
  json.url user_url(user, format: :json)
end
