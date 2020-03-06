class VersionsController < ApplicationController
  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped

  def index
    @versions = Version.all
  end

  def new
    @version = Version.new
    @startup = Startup.find(params[:startup_id])
  end

  def show
      @version = Version.find(params[:id])
      @questions = @version.questions
      # authorize @version
  end

  def create
    @version = Version.new(version_params)
    @version.startup = current_user.startup

    if @version.save
      redirect_to edit_startup_version_path(@version.startup, @version)
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
    redirect_to startup_version_path([@startup, @version])
  end

      private

    def version_params
      params.require(:version).permit(:name)
    end

end
