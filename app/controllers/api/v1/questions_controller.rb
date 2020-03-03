class Api::V1::QuestionsController < Api::V1::BaseController
  def create
    @question = Question.new question_params

    if @question.save
      render :show
    end
  end

  private

  def question_params
    params.require(:question).permit(:question, :version_id)
  end
end
