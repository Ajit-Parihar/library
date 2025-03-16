class AccountMailer < ApplicationMailer
  default from: 'pariharajit449@gmail.com'

  def signup_login_email
    @account = params[:account]
    mail(to: @account.email, subject: 'Sign up successful')
  end
end
