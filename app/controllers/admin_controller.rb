# frozen_string_literal: true

# @class AdminController
# @extend ApplicationController
# Main admin controller
class AdminController < ApplicationController
  before_action :admin_user!

  layout 'admin'

  private

  # Check user role. Is admin or not
  # Render error 403 page
  # @return render
  def admin_user!
    render_error_page(403, :forbidden) unless pundit_user.admin_role?
  end
end
