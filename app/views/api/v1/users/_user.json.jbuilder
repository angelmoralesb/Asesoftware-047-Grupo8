json.extract! user, :id, :email 
json.url api_v1_user_url(user, format: :json)
