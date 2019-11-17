class InfoService

  public

  def change_layout(user)
    'admin' if user.admin_role?
    'employee' if user.user_role?
  end

  def check_users(current_user, session_user)
    current_user == session_user
  end

end
