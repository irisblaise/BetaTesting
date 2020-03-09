class ReviewsController < ApplicationController

  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped

  def index
    @reviews = Review.all
  end

  def new
    @tester = Tester.find(params[:tester_id])
    @review = Review.new
  end

  def create
    @tester = Tester.find(params[:tester_id])
    @review = Review.new(review_params)
    @review = @review.tester_id
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
