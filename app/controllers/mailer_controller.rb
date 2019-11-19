# frozen_string_literal: true

# @class Mailer
# @extend Devise::Mailer
# Mailer controller
class Mailer < Devise::Mailer

  helper :application
  include Devise::Controllers::UrlHelpers
  # change default template mail
  default template_path: 'devise/mailer'

end
