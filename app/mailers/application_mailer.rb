class ApplicationMailer < ActionMailer::Base
  default from: ENV['MAILER_USERNAME']
  layout 'send_mail_report'
end
