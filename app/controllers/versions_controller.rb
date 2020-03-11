class VersionsController < ApplicationController

  def index
    # get access to the startup
    @startup = Startup.find params[:startup_id]

    @versions = @startup.versions
  end

  def new
    @version = Version.new
    @startup = Startup.find(params[:startup_id])
    # create an order with a stripe session
    authorize @version
  end

  def show
      @version = Version.find(params[:id])
      @questions = @version.questions
      @feedback = Feedback.all
      authorize @version
  end

  def create
    @version = Version.new(version_params)
    @version.startup = current_user.startup
    authorize @version

    if @version.save
      order = Order.initialize_with_stripe_session(@version)
      redirect_to order_path(order)
      # edit_startup_version_path(@version.startup, @version)
    else
    end
  end

  def edit
    @version = Version.find(params[:id])
    @startup = @version.startup
    authorize @startup

    if @version.order.state == 'pending'
      redirect_to order_path @version.order
    end
  end

  def update
    @version = Version.find(params[:id])
    @startup = @version.startup
    authorize @version
    @version.update(version_params)
    @version.save
    redirect_to startup_version_path([@startup, @version])
  end

  def destroy
    @version = Version.find(params[:id])
    @version.destroy
    authorize @version
    redirect_to dashboard_path
  end

      private

    def version_params
      params.require(:version).permit(:name, :quantity)
    end

end
