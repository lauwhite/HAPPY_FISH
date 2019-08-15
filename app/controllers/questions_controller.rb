class QuestionsController < ApplicationController
  def show
    @challenge = Challenge.find(params[:challenge_id])
    @questions = @challenge.questions
    @questions_nb = @questions.count
    @question = Question.find(params[:id])
    @answers = @question.answers
    @last_question_id = @challenge.questions.last.id
    raise
  end
end
