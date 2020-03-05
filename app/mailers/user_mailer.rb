class UserMailer < ApplicationMailer

  def welcome_startup
    @user = params[:user] # Instance variable => available in view
    mail(to: @user.email, subject: 'Welcome to BetaVision')
    # This will render a view in `app/views/user_mailer`!
  end

  def welcome_tester
    @user = params[:user] # Instance variable => available in view
    mail(to: @user.email, subject: 'Welcome to BetaVision')
    # This will render a view in `app/views/user_mailer`!
  end

end
