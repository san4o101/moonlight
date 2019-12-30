# frozen_string_literal: true

# @class AdminController
# @extend ApplicationController
# Main admin controller
class AdminController < ApplicationController

  before_action :admin_user!
  layout 'admin'

  add_breadcrumb I18n.t('breadcrumbs.home'), :admin_home_path

  private

  # Check user role. Is admin or not
  # Render error 403 page
  # @return render
  def admin_user!
    render_error_page(403, :forbidden) unless pundit_user.admin_role?
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    params[:id] = params[:user_id] unless params[:id].present?
    @user = User.find(params[:id])
  end
end
