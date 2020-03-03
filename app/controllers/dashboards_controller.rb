class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    @version = Version.new
  end
end
