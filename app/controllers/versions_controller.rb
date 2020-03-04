class VersionsController < ApplicationController
  def index
    @versions = Version.all
  end

  def show
      @version = Version.find(params[:id])
      @question = @version.question
  end

  def create
    @version = Version.new
    @version.startup = current_user.startup

    if @version.save
      redirect_to edit_version_path(@version)
    else
    end
  end

  def edit
    @startup = current_user.startup
    @version = Version.find params[:id]
  end

  # def create
  #     @version = Version.new(version_params)


  #     @version.user = current_user
  #     if @version.save
  #       # redirect_to dashboard_owner_path(@version.user)
  #     else
  #       render :new
  #     end
  # end

  # def edit
  #     @ = Car.find(params[:id])
  #     authorize_owner!(@)
  # end

  # def update
  # end

end
