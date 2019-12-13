# frozen_string_literal: true

require 'csv'

User.create(email: 'admin@moonlight.com', first_name: 'Admin',
            last_name: 'Admin', password: 'secret', role: User::ADMIN_ROLE,
            confirmed_at: '2019-11-01 00:01:00', birthday: '1998-10-06')

# Add Countries
CSV.foreach(Rails.root.join('lib/csv/country.csv'), headers: true) do |row|
  Country.create(short_code: row[0], nickname: row[1], name: row[2],
                 phone_code: row[3])
end

# Add Cities
CSV.foreach(Rails.root.join('lib/csv/cities.csv'), headers: true) do |row|
  if (country = Country.find_by(short_code: row[2]))
    country_id = country.id
    City.create(name: row[0], country_id: country_id)
  end
end