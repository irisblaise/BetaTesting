class Api::V1::FeedbacksController < Api::V1::BaseController

   skip_after_action :verify_authorized
   before_action :authenticate_user!

   def review
    feedback = Feedback.find(params[:id])

    stars = params[:stars]
    review = Review.find_or_create_by(feedback: feedback, startup_id: current_user.startup)
    review.rating = stars
    review.save
    respond_to do |format|
      format.json { render json: review }
    end
  end
end
