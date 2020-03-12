class Api::V1::FeedbacksController < Api::V1::BaseController
  after_action :verify_authorized, except: :review, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

   # skip_after_action :verify_authorized
   # before_action :authenticate_user!

   def review
    feedback = Feedback.find(params[:id])

    stars = params[:stars]
    review = Review.create(feedback: feedback, rating: stars, startup_id: params[:startup_id])
    respond_to do |format|
      format.json { render json: review }
    end
  end


end
