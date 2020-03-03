class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show

  end
  # def startup
  #   @tester = current_user.is_tester?
  # end

  # def tester
  #   byebug
  #   @tester = current_user.is_tester?
  # end
end
