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
  has_many :bills, -> { order_by_id }, foreign_key: :users_id
  has_many :manager_notifications, foreign_key: :admin_id
  has_many :bill_requests, foreign_key: :admin_id

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  DENY_DOMAINS = %w[test.com test.ru test.ua admin.com admin.ua admin.ru].freeze
  DENY_NAMES = %w[test administrator].freeze

  enum role: { admin: 1, user: 2 }, _suffix: true
  enum status: %i[active disable deleted blocked]
  enum gender: { male: 1, female: 2 }

  scope :admins, -> { where(role: :admin) }
  scope :employees, -> { where(role: :user) }

  validates_each :first_name, :last_name, :second_name do |record, attr, value|
    if value =~ /\A[а-яёїіє|a-z]/
      record.errors.add(attr, 'must start with upper case')
    end
  end
  validates :phone, numericality: { only_integer: true },
                    length: { is: 9 },
                    allow_blank: true
  validates :password, confirmation: true
  validate :email_start_is_deny?
  validate :email_end_is_deny?

  def full_name?
    first_name.nil? && last_name.nil?
  end

  def full_name
    "#{last_name.present? ? last_name : ''} #{first_name.present? ? first_name : ''} #{second_name.present? ? second_name : ''}"
  end

  def full_name_aliases
    "#{last_name.present? ? last_name : ''} #{first_name.present? ? first_name.chr + '.' : ''} #{second_name.present? ? second_name.chr + '.' : ''}"
  end

  def gender_name
    return I18n.t('user.gender.male') if male?
    I18n.t('user.gender.female') if female?
  end

  private

  def email_end_is_deny?
    DENY_DOMAINS.each do |domain|
      errors.add(:email, I18n.t('messages.errorDomain')) if email.end_with?('@' + domain)
    end
  end

  def email_start_is_deny?
    DENY_NAMES.each do |name|
      errors.add(:email, I18n.t('messages.errorName')) if email.start_with?(name + '@')
    end
  end

end
