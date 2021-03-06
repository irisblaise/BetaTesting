class StartupsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]
  skip_after_action :verify_authorized, only: [:new]

#     def index
#       @startups = policy_scope(Startup).select { |startup| startup.versions.length != 0 }
  def index
    if params[:query].present?
      @startups = policy_scope(Startup).where("company_name ILIKE '%#{params[:query]}%'").select { |startup| startup.versions.length != 0 }
    else
      @startups = policy_scope(Startup).select { |startup| startup.versions.length != 0 }
    end

    @all_startups = Startup.select { |startup| startup.versions.length != 0 } - @startups
  end

  def show
      @startup = Startup.find(params[:id])
      authorize @version
      # authorize @tester
  end

  def new
    unless current_user.is_tester?
      startup = Startup.find_or_create_by! user_id: current_user.id
      authorize startup
    end
    redirect_to dashboard_path
  end

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
    lala = params.require(:startup).permit(:company_name, :url, :description, :sector, :photo, target_age: [], target_education: [], target_nationality: [], target_rating: [], target_age: [], target_profession: [], target_sex: [])
    %w(target_age target_education target_nationality target_rating target_age target_profession target_sex).each do |key|
      lala[key] = lala[key].reject(&:empty?)
    end
    lala
  end
end
