json.extract! user, :id, :name, :age, :email
json.url user_url(user, format: :json)