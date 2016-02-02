class Inquirymailer < ApplicationMailer
  default from: "ihatov08@gmail.com"
  default to: "ihatov08@gmail.com"

def received_email(inquiry)
    @inquiry = inquiry
    mail(:subject => 'お問い合わせを承りました')
  end

end
