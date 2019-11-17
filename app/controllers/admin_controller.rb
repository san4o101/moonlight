class AdminController < ApplicationController

  include ApplicationHelper

  before_action :authenticate_user!

  layout 'admin'

  private

  def authenticate_user!
    unless pundit_user.admin_role?
      render_error_page(403, :forbidden)
    end
  end

end
