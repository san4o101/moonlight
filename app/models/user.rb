# frozen_string_literal: true

# @class User
# @extend ApplicationRecord
# User model
# @param integer id
# @param string email
# @param string first_name
# @param string last_name
# @param string second_name
class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  ADMIN_ROLE = 1
  USER_ROLE  = 2

  scope :admins, -> { where(role: ADMIN_ROLE) }
  scope :employees, -> { where(role: USER_ROLE) }

  validates_each :first_name, :last_name, :second_name do |record, attr, value|
    if value =~ /\A[а-яёїіє|a-z]/
      record.errors.add(attr, 'must start with upper case')
    end
  end

  def admin_role?
    role == ADMIN_ROLE
  end

  def user_role?
    role == USER_ROLE
  end

  def full_name?
    first_name.nil? && last_name.nil?
  end

  def full_name
    "#{last_name} #{first_name} #{second_name}"
  end

end
