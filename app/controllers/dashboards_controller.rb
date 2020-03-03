class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def startup
    @tester = current_user.is_tester?
  end

  def tester

  end
end
