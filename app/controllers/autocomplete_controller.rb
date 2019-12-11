# frozen_string_literal: true

# @class AutocompleteController
# @extend ApplicationController
# Autocomplete controller
class AutocompleteController < ApplicationController

  # Autocomplete cities
  def autocomplete_city
    city = City.joins(:country).where('cities.name like ?', "%#{params[:city]}%")
               .select('countries.phone_code, countries.name as country_name,
                        cities.country_id, cities.id, cities.name')
               .limit(10)
    render :json => {city: city}
  end

end
