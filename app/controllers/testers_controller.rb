class TestersController < ApplicationController
  def index
    @testers = Tester.all
  end

  def show
    @tester = Tester.find(params[:id])
  end

  def edit
  end

  def update
  end

  private
  def request_params
    params.require(:tester).permit()
  end
end
