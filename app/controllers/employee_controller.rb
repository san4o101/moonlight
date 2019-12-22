# frozen_string_literal: true

# @class EmployeeController
# @extend ApplicationController
# Main employee controller
class EmployeeController < ApplicationController

  before_action :employee_user!

  layout 'employee'

  private

  # Check user role. Is employee or not
  # Render error 403 page
  # @return render
  def employee_user!
    render_error_page(403, :forbidden) unless pundit_user.user_role?
  end

  def set_user
    @current_user = User.find(session[:user_id])
  end

end

