class UserMailer < ApplicationMailer
  def account_activation user
    @user = user
    mail to: user.email, subject: t("mailer.user.subject")
  end

  def password_reset user
    @user = user
    mail to: user.email, subject: t("mailer.user.password_reset")
  end
end
