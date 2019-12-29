class City < ApplicationRecord
  belongs_to :country
  has_many :users, foreign_key: :cities_id

  paginates_per 15

end
