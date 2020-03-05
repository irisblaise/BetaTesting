class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    @startup = Startup.find_by(user: current_user)
    @version = Version.new
    @tester = Tester.find_or_create_by! user_id: current_user.id
    authorize @current_user.tester
  end



end
