class ConfirmationsController < Devise::ConfirmationsController

  include ApplicationHelper

  private

  def after_confirmation_path_for(resource_name, resource)
    sign_in(resource)
    redirect_to_role_route(resource)
  end

end
