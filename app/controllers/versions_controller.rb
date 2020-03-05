class VersionsController < ApplicationController
  def index
    @versions = Version.all
  end

  def show
      @version = Version.find(params[:id])
      @questions = @version.questions

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
    @version = Version.find(params[:id])
    @startup = @version.startup
  end

  def update
    @version = Version.find(params[:id])
    @startup = @version.startup

      @version.update(version_params)
      @version.save
      redirect_to versions_path
  end

      private

    def version_params
      params.require(:version).permit(:name)
    end

end
