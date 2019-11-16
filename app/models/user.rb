class User < ApplicationRecord

  ADMIN_ROLE = 1
  USER_ROLE  = 2

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  def admin_role?
    role == ADMIN_ROLE
  end

  def user_role?
    role == USER_ROLE
  end

end
