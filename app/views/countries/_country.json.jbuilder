json.extract! country, :id, :name, :short_code, :phone_code, :nickname, :created_at, :updated_at
json.url country_url(country, format: :json)
