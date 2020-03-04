class TestersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @testers = Tester.all
  end

  def show
    @tester = Tester.find(params[:id])
  end

  def edit
    @tester = current_user.tester
  end

  def update
    @tester = current_user.tester
    @tester.update(tester_params)
    if @tester.save
      redirect_to dashboard_path
    else
      render "new"
    end
  end

  def new
    tester = Tester.find_or_create_by! user_id: current_user.id
    redirect_to dashboard_path
  end

  def create
    @tester = Tester.new(tester_params)
    @tester.user = current_user
    if @tester.save

      redirect_to dashboard_path
    else
      render "new"
    end
  end


  private
  def tester_params
    params.require(:tester).permit(:education, :profession, :nationality, :sex, :age, :photo)
  end
end
