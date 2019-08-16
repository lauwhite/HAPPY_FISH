class ChallengesController < ApplicationController
  def index
    @challenges = Challenge.all
    @daily_challenges = Challenge.where(duration: "Daily")
    @weekly_challenges = Challenge.where(duration: "Weekly")
    @monthly_challenges = Challenge.where(duration: "Monthly")
  end

  def show
    @challenge = Challenge.find(params[:id])
    @my_challenge = GameChallenge.new
  end

  def completed
    @challenge = Challenge.find(params[:id])
    if @challenge.duration == "Daily"
      @my_challenge = GameChallenge.new
      @my_challenge.challenge = @challenge
      @my_challenge.my_fish = current_user.my_fishes.where(alive: true).first
      @my_challenge.start_time = DateTime.now
      @my_challenge.end_time = DateTime.now
      @my_challenge.status = "Completed"
      @my_challenge.save!
      current_user.score += (@my_challenge.challenge.score_health)
      current_user.my_fishes.first.score_health += (@my_challenge.challenge.score_health)
    else
      current_user.score += (@my_challenge.challenge.score_health) / 2
      current_user.my_fishes.first.score_health += (@my_challenge.challenge.score_health) / 2
    end
    current_user.save!
    current_user.my_fishes.first.score_happiness += (@my_challenge.challenge.score_happiness)
    raise
    current_user.my_fishes.first.save!
  end

end




