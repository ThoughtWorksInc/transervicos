class TransMailer < ApplicationMailer
  DEFAULT_SUBJECT = 'TRANSERVIÇOS: Serviço com Denúncia'
  ADMIN_EMAIL = 'andriele.menegotto@gmail.com'

  def send_mail_report(report)
    @report = report
    bcc_mails = [ADMIN_EMAIL, @report.email, @report.service.user.email]

    bcc_mails.push(@report.service.owner_email) if @report.service.owner_email

    mail(bcc: bcc_mails, subject: DEFAULT_SUBJECT, to: 'andriele.menegotto@gmail.com')
  end
end
