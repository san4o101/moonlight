class AdminController < ApplicationController
  before_action :authenticate_user!

  layout 'admin'

  private

  def authenticate_user!
    unless pundit_user.admin_role?
      ApplicationHelper.render_error_page(403, :forbidden)
    end
  end

end
