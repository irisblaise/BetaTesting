class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    @startup = current_user.startup
    @versions = current_user.startup.versions
    @tester = current_user.tester

    authorize(:dashboard, :show?)
  end
end
