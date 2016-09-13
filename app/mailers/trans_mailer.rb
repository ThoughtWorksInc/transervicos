class TransMailer < ApplicationMailer
  # default from: ENV['MAILER_USERNAME']
  DEFAULT_SUBJECT = 'TRANSERVIÇOS: Serviço com Denúncia'
  ADMIN_EMAIL = 'amenegot@thoughtworks.com'

  def send_mail_report(report)
    @report = report
    bcc_mails = [@report.email, @report.service.user.email]

    bcc_mails.push(@report.service.owner_email) if @report.service.owner_email

    mail(bcc: bcc_mails, subject: DEFAULT_SUBJECT, to: ADMIN_EMAIL, from: @report.service.user.email)
  end
end
