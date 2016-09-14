class TransMailer < ApplicationMailer
  DEFAULT_SUBJECT = 'TRANSERVIÇOS: Serviço com Denúncia'

  def send_mail_report(report)
    @report = report
    bcc_mail = [@report.email]

    bcc_mail.push(@report.service.owner_email) if @report.service.owner_email

    mail(bcc: bcc_mail, subject: DEFAULT_SUBJECT, to: @report.service.user.email, from: @report.service.user.email)
  end
end
