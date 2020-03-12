class Api::V1::QuestionsController < Api::V1::BaseController
   # skip_after_action :verify_authorized
   before_action :authenticate_user!

   def create
    @question = Question.new question_params

    if @question.save
      render :show
      authorize @question
    end
  end

  def destroy
    @question = Question.find params[:id]

    if @question.destroy
      head :no_content
      authorize @question
    end
  end

  def rating
    # @question = Question.find params[:id]
    # stars = params[:stars]

  end

  private

  def question_params
    params.require(:question).permit(:question, :version_id)
  end
end
