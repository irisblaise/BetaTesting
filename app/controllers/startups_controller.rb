class StartupsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

    def index
      @startups = policy_scope(Startup)
    end

  def show
      @startup = Startup.find(params[:id])
  end

  def new
      @startup = Startup.new
      redirect_to dashboard_path
      authorize @startup
    end
  
#   def new
#       if !current_user.is_tester?
#         startup = Startup.find_or_create_by! user_id: current_user.id
#       end

#       redirect_to dashboard_path
#     end
  

    def create
      @startup = Startup.new(startup_params)
      @startup.user = current_user
      authorize @startup
      if @startup.save
        redirect_to dashboard_path
      else
        render :new
      end
    end

    def edit
      @startup = current_user.startup
      authorize @startup
    end

    def update
      @startup = current_user.startup
      @startup.update(startup_params)
      authorize @startup
      if @startup.save
        redirect_to dashboard_path
      else
        render "new"
      end
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
