class Country < ApplicationRecord
  has_many :cities

  scope :by_short_code, ->(short_code) { where(short_code: short_code) }

end
