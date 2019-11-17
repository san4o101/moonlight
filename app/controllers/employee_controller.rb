class EmployeeController < ApplicationController

  before_action :authenticate_user!

  layout 'employee'

  def authenticate_user!
    render_error_page(403, :forbidden) unless pundit_user.user_role?
  end

end

