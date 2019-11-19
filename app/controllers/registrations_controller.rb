# frozen_string_literal: true

# @class RegistrationsController
# @extend Devise::RegistrationsController
# Registration controller
class RegistrationsController < Devise::RegistrationsController
  protected

  # @param resource
  # resource -> User
  # Flash to login page when confirm email
  def after_sign_up_path_for(resource)
    flash[:success] = t('user.action.confirmEmail')
  end
end
