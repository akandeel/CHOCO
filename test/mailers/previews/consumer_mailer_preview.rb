# Preview all emails at http://localhost:3000/rails/mailers/consumer_mailer
class ConsumerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/consumer_mailer/account_activation
  def account_activation
    ConsumerMailer.account_activation
  end

  # Preview this email at http://localhost:3000/rails/mailers/consumer_mailer/password_reset
  def password_reset
    ConsumerMailer.password_reset
  end

end
