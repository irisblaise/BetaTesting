class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    @startup = Startup.find_by(user: current_user)
    @version = Version.new

  end


  # def index
  #   @startups = Startup.all
  # end

  # def update
  #   @tester = Tester.find(params[:id])
  #   @tester.update(tester_params)

  #   if @tester.save
  #     redirect_to dashboard_path
  #   else
  #     render "new"
  #   end
  # end

end
