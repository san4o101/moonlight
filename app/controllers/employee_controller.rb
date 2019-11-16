class EmployeeController < ApplicationController
  before_action :authenticate_user!

  layout 'employee'

  def authenticate_user!
    unless pundit_user.user_role?
      ApplicationHelper.render_error_page(403, :forbidden)
    end
  end

end

