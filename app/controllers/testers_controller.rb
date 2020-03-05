class TestersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @testers = policy_scope(Tester)
  end

  # def show
  #   @tester = Tester.find_or_create_by! user_id: current_user.id
  #   authorize @current_user.tester
  # end

  def edit
    @tester = current_user.tester
    authorize @tester
  end

  def update
    @tester = current_user.tester
    @tester.update(tester_params)
    authorize @tester
    if @tester.save
      redirect_to dashboard_path
    else
      render "new"
    end
  end

  def new
    @tester = Tester.find_or_create_by! user_id: current_user.id
    redirect_to dashboard_path
    authorize @tester
  end

  def create
    @tester = Tester.new(tester_params)
    @tester.user = current_user
    authorize @tester
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
