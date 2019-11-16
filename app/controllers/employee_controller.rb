class EmployeeController < ApplicationController
  before_action :authenticate_user!

  layout 'employee'

  def authenticate_user!
    unless pundit_user.user_role?
      render(file: File.join(Rails.root, 'public/403.html'), status: :forbidden,
             layout: false)
    end
  end

end

