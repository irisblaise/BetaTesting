class RegistrationsController < Devise::RegistrationsController
  def create
    # 1. create user and assign it to a variable
    user = User.create email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation]

    if params[:user_type] == 'tester'
      # 2. create a tester and assign a user_id of user.id
      user.tester = Tester.create
    else
      user.startup = Startup.create
    end

    sign_in(user, scope: :user)
  end
end
