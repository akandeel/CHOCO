class AccountActivationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.account_activation_mailer.password_reset.subject
  #
  def password_reset
    @greeting = "Hi"

    mail to: user.email_address
  end
end
