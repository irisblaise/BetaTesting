class StartupsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

    def index
      @startups = Startup.all
    end

    def show
      @startup = Startup.find(params[:id])
    end

    def new
      @startup = Startup.new
    end

    def create
      @startup = Startup.new(startup_params)
      @startup.user = current_user
      if @startup.save
        redirect_to user_startup_path(@startup.user)
      else
        render :new
      end
    end

    def edit
      @startup = Startup.find(params[:id])

    end

    def update
      @startup = Startup.find(params[:id])
      @startup.update(startup_params)
      @startup.save
      redirect_to user_startup_path(@startup.user)
    end

    def destroy
      @startup = Startup.find(params[:id])
      @startup.destroy
      # redirect_to dashboard_owner_path
    end

    private

    def startup_params
      params.require(:startup).permit(:company_name, :url, :description, :sector, :photo)
    end
end
