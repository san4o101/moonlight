class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    flash[:success] = t('user.action.confirmEmail')
  end
end
