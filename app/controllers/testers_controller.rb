class TestersController < ApplicationController
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
      # show errors
    end
  end


  private
  def tester_params
    params.require(:tester).permit(:education, :profession, :nationality, :sex, :age)
  end
end
