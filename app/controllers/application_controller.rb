# frozen_string_literal: true

# @class ApplicationController
# @extend ActionController::Base
# Main controller
class ApplicationController < ActionController::Base

  # csrf-token
  protect_from_forgery
  # Include module Pundit
  include Pundit

  # Except auth user
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  # After sing in path
  # resource -> User
  # @param resource
  # @return path
  def after_sign_in_path_for(resource)
    session[:user_id] = resource.id
    resource.update(status: User::STATUS_ACTIVE)
    redirect_to_role_route(resource)
  end

  # Render error page with error and status
  # @param error
  # @param status
  # @return error page
  def render_error_page(error, status)
    render(file: File.join(Rails.root, "public/#{error}.html"),
           status: status, layout: false)
  end

  # Redirect to user role path (route)
  # Admin     -> /admin
  # Employee  -> /employee
  # If not user name -> enter information route
  # @return user_path
  def redirect_to_role_route(user)
    return info_path(user) if user.full_name?
    return admin_home_path if user.admin_role?
    employee_home_path if user.user_role?
  end

  private

  # Except function
  # If user not authorized
  # @return redirect_to_sign_in_route
  def user_not_authorized
    flash[:alert] = t('user.message.notAuthorized')
    redirect_to(request.referrer || '/users/sign_in')
  end

  # pundit_user = session_user
  # @return User
  def pundit_user
    User.find(session[:user_id])
  end

  def user_admin
    pundit_user.admin_role?
  end

end
