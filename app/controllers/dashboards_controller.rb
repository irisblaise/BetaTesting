class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    @startup = current_user.startup
    @version = Version.new
    @tester = current_user.tester

    authorize(:dashboard, :show?)
  end



end
