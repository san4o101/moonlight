class City < ApplicationRecord
  belongs_to :country
  has_many :users

  paginates_per 15

end
