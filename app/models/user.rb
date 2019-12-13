# frozen_string_literal: true

# @class User
# @extend ApplicationRecord
# User model
# @param integer id
# @param string email
# @param string first_name
# @param string last_name
# @param string second_name
# @param string status
# @param integer phone
# @param date birthday
# @param integer gender
class User < ApplicationRecord

  belongs_to :city, optional: true, foreign_key: :cities_id

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  ADMIN_ROLE = 1
  USER_ROLE  = 2

  STATUS_ACTIVE   = 'active'
  STATUS_DISABLE  = 'disable'
  STATUS_DELETE   = 'delete'
  STATUS_BLOCKED  = 'blocked'

  GENDER_MALE   = 1
  GENDER_FEMALE = 2

  scope :admins, -> { where(role: ADMIN_ROLE) }
  scope :employees, -> { where(role: USER_ROLE) }

  validates_each :first_name, :last_name, :second_name do |record, attr, value|
    if value =~ /\A[а-яёїіє|a-z]/
      record.errors.add(attr, 'must start with upper case')
    end
  end
  validates :phone, numericality: { only_integer: true },
                    length: { is: 9 },
                    allow_blank: true

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

  private

end
