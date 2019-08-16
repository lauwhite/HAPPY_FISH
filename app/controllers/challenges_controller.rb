class ChallengesController < ApplicationController
  def index
    @challenges = Challenge.all
    @daily_challenges = Challenge.where(duration: "Daily")
    @weekly_challenges = Challenge.where(duration: "Weekly")
    @monthly_challenges = Challenge.where(duration: "Weekly")
  end

  def show
    @challenge = Challenge.find(params[:id])
    @my_challenge = GameChallenge.new
  end

  def completed
    @challenge = Challenge.find(params[:id])
  end
end
