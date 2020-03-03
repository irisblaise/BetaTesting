class TestersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @testers = Tester.all
  end

  def show
    @tester = Tester.find(params[:id])
  end

  def edit
    @tester = Tester.find(params[:id])
  end

  def update
    @tester = Tester.find(params[:id])
    @tester.update(tester_params)

    if @tester.save
      redirect_to tester_path(@tester)
    else
      render "new"
    end
  end

  def new
    @tester = Tester.new
  end

  def create
    @tester = Tester.new(tester_params)
    @tester.user = current_user

    byebug

    if @tester.save
      # redirect_to dashboard_tester_path(@tester.user)
      redirect_to root_path
    else
      render "new"
    end
  end


  private
  def tester_params
    params.require(:tester).permit(:education, :profession, :nationality, :sex, :age)
  end
end
