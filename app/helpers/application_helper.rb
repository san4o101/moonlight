module ApplicationHelper

  def redirect_to_role_route(user)
    admin_home_path if user.admin_role?
    employee_home_path if user.user_role?
  end

  def render_error_page(error, status)
    render(file: File.join(Rails.root, 'public/' + error + '.html'),
           status: status, layout: false)
  end

end
