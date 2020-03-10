class AnswersController < ApplicationController


  def create
    all_answers = []

    params[:questions].each_with_index do |question_id, index|
      @question = Question.find(question_id)
      @version = @question.version
      @feedback = Feedback.find_or_create_by! tester_id: current_user.tester.id, version_id: @version.id

      all_answers.push({
        feedback_id: @feedback.id,
        question_id: question_id,
        answer: params[:answers][index]
      })
    end
    authorize @feedback.tester
    @feedback.update(feedback_params) if params[:feedback]
    @feedback.save

    Answer.create(all_answers)

    redirect_to dashboard_path
  end

  private

  def feedback_params
    params.require(:feedback).permit(:website_ux, :website_ui, :website_latency, :website_fluidity, :website_design)
  end


end
