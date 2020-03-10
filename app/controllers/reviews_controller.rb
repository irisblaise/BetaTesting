class ReviewsController < ApplicationController


  def index
    @reviews = Review.all
  end

  def new
    @feedback = Feedback.find(params[:feedback_id])
    @tester = @feedback.tester
    @review = Review.new

    @startup = current_user.startup
    authorize @startup
  end

  def create
    @feedback = Feedback.find(params[:feedback_id])
    @review = Review.new(review_params)
    @review.feedback = @feedback
    @startup = current_user.startup
    @review.startup = @startup
    authorize @startup
    if @review.save
      redirect_to dashboard_path
    else
      render :new
    end
  end


  private
  def review_params
    params.require(:review).permit(:rating, :tester_id)
  end

end
