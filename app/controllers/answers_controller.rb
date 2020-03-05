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

    Answer.create(all_answers)

    redirect_to dashboard_path
  end
end
