class OnboardingQuestionsController < ApplicationController
  def show
    @question = OnboardingQuestion.find(params[:id])
  end
end
