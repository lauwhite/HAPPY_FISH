class OnboardingQuestionsController < ApplicationController
  def show
    @question = OnboardingQuestion.find(params[:id])
  end

  def click
    if OnboardingQuestion.last.id != params[:question].to_i
      question = OnboardingQuestion.find(params[:question].to_i + 1)
    # previous_answer = OnboardingAnswer.find(params[:id])
    # current_user.score += previous_answer.score
      current_user.score += params[:score].to_i
      current_user.save
      redirect_to onboarding_question_path(question)
    else
      redirect_to fishes_path
    end
  end
end
