class ChallengesController < ApplicationController
  def index
    @challenges = Challenge.includes(:game_challenges).where( :game_challenges => { :challenge_id => nil } )
    @daily_challenges = @challenges.where(duration: "Daily")
    @weekly_challenges = @challenges.where(duration: "Weekly")
    @monthly_challenges = @challenges.where(duration: "Monthly")
    @abandoned_challenges = Challenge.joins(:game_challenges).where("game_challenges.status = ?", "Abandoned")
    @repeatable_challenges = Challenge.joins(:game_challenges).where("game_challenges.status = ? AND challenges.repeatable = ? ", "Completed", true)
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
      my_fish = current_user.my_fishes.first
      my_fish.score_health += (@my_challenge.challenge.score_health)
    else
      current_user.score += (@my_challenge.challenge.score_health) / 2
      my_fish.score_health += (@my_challenge.challenge.score_health) / 2
    end
    current_user.save!
    my_fish.score_happiness += (@my_challenge.challenge.score_happiness) unless my_fish.score_happiness == 5.0
    my_fish.score_health = 100 if my_fish.score_health > 100
    my_fish.save!
    @my_fish = my_fish.name
  end

  def onboarding_challenge
    # use params to get the score from each question
    # sum them
    # update current_score.score
  end

end




