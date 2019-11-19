class EmployeeController < ApplicationController

  before_action :employee_user!

  layout 'employee'

  private

  def employee_user!
    render_error_page(403, :forbidden) unless pundit_user.user_role?
  end

end

