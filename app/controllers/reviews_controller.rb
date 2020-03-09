class ReviewsController < ApplicationController

  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped

  def index
    @reviews = Review.all
  end

  def new
    @tester = Tester.find(params[:tester_id])
  end

  def create
  end



  private
  def review_params
    params.require(:review).permit(:rating, :tester_id)
  end

end
