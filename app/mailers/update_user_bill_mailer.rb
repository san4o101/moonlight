class UpdateUserBillMailer < ApplicationMailer

  default from: ENV['MAILER_USER']
  default template_path: 'mailer/'

  def submission(message, to_email)
    @message = message
    @email = to_email
    mail(to: to_email, subject: t('mails.update_bill.subject'))
  end

end
