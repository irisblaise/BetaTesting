class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    @startup = Startup.find_or_create_by(user: current_user)
    @version = Version.new
    @tester = Tester.find_or_create_by(user: current_user)

    authorize(:dashboard, :show?)
  end



end
