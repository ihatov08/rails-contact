class UserMailer < ApplicationMailer

  default from: "ihatov08@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.registration_confirmation.subject
  #
  def registration_confirmation
    @greeting = "Hi"

    mail to: "ihatov08@gmail.com"
  end
end
