# frozen_string_literal: true

# @class InfoService
# Info service function class
class InfoService

  # Return user layout on role
  # @param user
  # @return string
  def change_layout(user)
    return 'admin' if user.admin_role?
    'employee' if user.user_role?
  end

  # Check current and session user
  # @return bool
  def check_users(current_user, session_user)
    current_user == session_user
  end

end
