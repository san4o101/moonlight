json.extract! user, :id, :name, :cities_id, :created_at, :updated_at
json.url admin_setting_user_url(user, format: :json)
