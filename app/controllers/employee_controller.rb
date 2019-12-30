# frozen_string_literal: true

# @class EmployeeController
# @extend ApplicationController
# Main employee controller
class EmployeeController < ApplicationController

  before_action :employee_user!
  layout 'employee'

  add_breadcrumb I18n.t('breadcrumbs.home'), :employee_home_path

  private

  # Check user role. Is employee or not
  # Render error 403 page
  # @return render
  def employee_user!
    render_error_page(403, :forbidden) unless pundit_user.user_role?
  end

  def set_user
    @current_user = pundit_user
  end

  # Used only after set_user
  def my_bill?
    my_bills_id = Bill.my_bills(@current_user.id).pluck(:id)
    params[:id] = params[:bill_id] unless params[:id].present?
    unless my_bills_id.include?(params[:id].to_i)
      render_error_page(403, :forbidden)
    end
  end

end

