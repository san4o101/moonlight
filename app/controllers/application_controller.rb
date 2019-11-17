class ApplicationController < ActionController::Base

  include ApplicationHelper

  # TODO: testing this
  # before_action :set_locale
  # def set_locale
  #   if current_user
  #     I18n.locale = current_user.locale || I18n.default_locale
  #   else
  #     super
  #   end
  # end

  protect_from_forgery
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def after_sign_in_path_for(resource)
    redirect_to_role_route(resource)
  end

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to(request.referrer || '/users/sign_in')
  end

end
