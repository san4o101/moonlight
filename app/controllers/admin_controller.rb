class AdminController < ApplicationController

  before_action :authenticate_user!

  layout 'admin'

  private

  def authenticate_user!
    render_error_page(403, :forbidden) unless pundit_user.admin_role?
  end

end
