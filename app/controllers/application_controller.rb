class ApplicationController < ActionController::Base

  protect_from_forgery
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def after_sign_in_path_for(resource)
    session[:user_id] = resource.id
    redirect_to_role_route(resource)
  end

  def render_error_page(error, status)
    render(file: File.join(Rails.root, "public/#{error}.html"),
           status: status, layout: false)
  end

  def redirect_to_role_route(user)
    return info_path(user) if user.full_name?
    return admin_home_path if user.admin_role?
    employee_home_path if user.user_role?
  end

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to(request.referrer || '/users/sign_in')
  end

  def pundit_user
    User.find(session[:user_id])
  end

end
