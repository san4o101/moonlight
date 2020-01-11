# frozen_string_literal: true

# @class ConfirmationsController
# @extend Devise::ConfirmationsController
# Confirmed user
class ConfirmationsController < Devise::ConfirmationsController

  include ApplicationHelper

  private

  # @param resource_name
  # @param resource
  # resource -> User
  # After user click to link in Email message
  # sign in user
  # @return redirect_to_user_route
  def after_confirmation_path_for(resource_name, resource)
    sign_in(resource)
    session[:user_id] = resource.id
    resource.update(status: User.statuses[:active])
    BillsCreateJob.perform_later(resource, Bill.bill_types[:deposit])
    redirect_to_role_route(resource)
  end

end
