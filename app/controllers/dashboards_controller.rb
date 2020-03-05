class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    @startup = Startup.find_by_id(current_user.id)
    @version = Version.new
    @tester = Tester.find_by_id(current_user.id)

    authorize(:dashboard, :show?)
  end



end
