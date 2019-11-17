class EmployeeController < ApplicationController

  include ApplicationHelper

  before_action :authenticate_user!

  layout 'employee'

  def authenticate_user!
    unless pundit_user.user_role?
      render_error_page(403, :forbidden)
    end
  end

end

