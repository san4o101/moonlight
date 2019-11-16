class AdminController < ApplicationController
  before_action :authenticate_user!

  layout 'admin'

  private

  def authenticate_user!
    unless pundit_user.admin_role?
      render(file: File.join(Rails.root, 'public/403.html'), status: :forbidden,
             layout: false)
    end
  end

end
