class ConsumerMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.consumer_mailer.account_activation.subject
  #
  def account_activation
    @consumer = consumer
    @greeting = "Hi"

    mail to: consumer.email_address, subject:"WELCOME TO CHOCOLALA!"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.consumer_mailer.password_reset.subject
  #
  def password_reset
    @greeting = "Hi"

    mail to: consumer.email_address
  end
end
