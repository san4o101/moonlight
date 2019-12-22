# frozen_string_literal: true

# @class ConfirmationsController
# @extend Devise::ConfirmationsController
# Confirmed user
class ConfirmationsController < Devise::ConfirmationsController

  private

  # @param resource_name
  # @param resource
  # resource -> User
  # After user click to link in Email message
  # sign in user
  # @return redirect_to_user_route
  def after_confirmation_path_for(resource_name, resource)
    sign_in(resource)
    resource.update(status: User::STATUS_ACTIVE)
    BillsCreateJob.perform_later(resource)
    ApplicationController.redirect_to_role_route(resource)
  end

end
