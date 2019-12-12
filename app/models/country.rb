class Country < ApplicationRecord
  has_many :cities

  paginates_per 15

  scope :by_short_code, ->(short_code) { where(short_code: short_code) }

end
