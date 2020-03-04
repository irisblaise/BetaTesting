class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    @startup = Startup.find_by(user: current_user)
    @version = Version.new
  end


end
