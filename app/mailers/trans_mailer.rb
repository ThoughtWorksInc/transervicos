class TransMailer < ApplicationMailer
  DEFAULT_SUBJECT = 'TRANSERVIÇOS: Serviço com Denúncia'
  ADMIN_EMAIL = 'andriele.menegotto@gmail.com'

  def send_mail_report(report)
    p '=========transmaile'
    p report
    p '=========transmaile'
    # @report = report
    # bcc_mails = [ADMIN_EMAIL, @report.email, @report.service.user.email]
    # if @report.service.owner_email
    #   bcc_mails.push(@report.service.owner_email)
    # end
    # mail(bcc: bcc_mails, subject: DEFAULT_SUBJECT, to:'andriele.menegotto@gmail.com')
    mail(to: ADMIN_EMAIL, subject: DEFAULT_SUBJECT)
  end
end
