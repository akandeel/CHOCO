# Preview all emails at http://localhost:3000/rails/mailers/acocunt_activation_mailer
class AcocuntActivationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/acocunt_activation_mailer/password_reset
  def password_reset
    AcocuntActivationMailer.password_reset
  end

end
