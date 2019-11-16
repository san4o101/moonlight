class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    flash[:success] = 'Confirm you Email!'
  end
end
