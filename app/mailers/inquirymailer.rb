class Inquirymailer < ApplicationMailer
  default from: "ihatov08@gmail.com"
  default to: "info@nowall.co.jp"

def received_email(inquiry)
    @inquiry = inquiry
    mail(:subject => 'お問い合わせを承りました')
  end

end
