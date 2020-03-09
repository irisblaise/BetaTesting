class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    if current_user.is_startup?
      @startup = current_user.startup
      @versions = current_user.startup.versions
    elsif current_user.is_tester?
      @tester = current_user.tester
    end

    authorize(:dashboard, :show?)
  end
end
