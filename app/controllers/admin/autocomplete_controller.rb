module Admin

  # frozen_string_literal: true

  # @class AutocompleteController
  # @extend ApplicationController
  # Autocomplete controller
  class AutocompleteController < AdminController

    # Autocomplete administrator name
    def autocomplete_admin
      p params
      admin = User.admins.where("CONCAT(first_name, ' ', last_name, ' ', second_name) like :name", name: "%#{params[:name]}%")
                  .select(:id, :first_name, :last_name, :second_name)
                  .select("CONCAT(first_name, ' ', last_name, ' ', second_name) as full_name")
                  .limit(10)
      render json: { admin: admin }
    end

  end


end