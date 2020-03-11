class TestersController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @testers = policy_scope(Tester)
  end

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
    if current_user.is_startup?
      redirect_to new_startup_path
    else
      tester = Tester.find_or_create_by! user_id: current_user.id
      authorize tester
      redirect_to dashboard_path
    end
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
