class ConfirmationsController < Devise::ConfirmationsController

  private

  def after_confirmation_path_for(resource_name, resource)
    sign_in(resource)
    ApplicationController.redirect_to_role_route(resource)
  end

end
