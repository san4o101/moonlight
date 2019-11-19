class AdminController < ApplicationController

  before_action :admin_user!

  layout 'admin'

  private

  def admin_user!
    render_error_page(403, :forbidden) unless pundit_user.admin_role?
  end

end
