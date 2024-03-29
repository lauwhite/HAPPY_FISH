class MyChallengesController < ApplicationController

  def index
    if MyFish.where(alive: true, user_id: current_user.id).empty?
      redirect_to fishes_path
    end
    @challenges = Challenge.includes(:game_challenges)
    # Causing daily challenges to be empty
    # .where(game_challenges: { challenge_id: nil })
    @daily_challenges = @challenges.where(duration: "Daily")

    @my_ongoing_challenge = []
    my_ongoing_challenges = GameChallenge.where(status: "Ongoing")
    my_ongoing_challenges.each do |oc|
      @my_ongoing_challenge << oc if oc.my_fish.user == current_user
    end

    @my_last_ongoing_challenge = @my_ongoing_challenge.reverse.take(2)

    @my_complete_challenges = []
    my_completed_challenges = GameChallenge.where(status: "Completed")
    my_completed_challenges.each do |cc|
      @my_complete_challenges << cc if cc.my_fish.user == current_user
    end

    @my_last_complete_challenges = @my_complete_challenges.reverse.take(2)
    # @my_fish = MyFish.find_by(alive: true)
  end

  def ongoing
    @my_ongoing_challenge = []
    my_ongoing_challenges = GameChallenge.where(status: "Ongoing")
    my_ongoing_challenges.each do |oc|
      @my_ongoing_challenge << oc if oc.my_fish.user == current_user
    end
  end

  def completed
    @my_complete_challenges = []
    my_completed_challenges = GameChallenge.where(status: "Completed")
    my_completed_challenges.each do |cc|
      @my_complete_challenges << cc if cc.my_fish.user == current_user
    end
  end

  def show
    @my_challenge = GameChallenge.find(params[:id])
    @challenge = Challenge.find(@my_challenge.challenge_id)
    @progress = calculate_progress(@my_challenge)
    # MyChallenge.all.length == 10
    # Mychallenge.where(status: 'finished').length == 5
  end

  def create
    @my_challenge = GameChallenge.new(my_challenge_params)
    @my_challenge.my_fish = current_user.my_fishes.where(alive: true).first
    @my_challenge.start_time = DateTime.now
    @my_challenge.end_time = calculate_end_time(@my_challenge)
    @my_challenge.status = "Ongoing"
    my_fish = current_user.my_fishes.where(alive: true).first
    if @my_challenge.save
      current_user.score += (@my_challenge.challenge.score_health) / 2
      my_fish.score_health += (@my_challenge.challenge.score_health) / 2
      if my_fish.score_health > 100
        my_fish.score_health = 100
      end

      current_user.save!
      my_fish.save!
      redirect_to ongoing_challenge_path(@my_challenge.challenge_id)
    else
      redirect_to challenge_path(@my_challenge.challenge_id)
    end
  end

  def update
    @my_challenge = GameChallenge.find(params[:id])
    if @my_challenge.end_time.to_datetime > DateTime.now
      @my_challenge.status = "Abandoned"
      current_user.score -= (@my_challenge.challenge.score_health) / 2
      current_user.score = 0 if current_user.score.negative?
      my_fish = current_user.my_fishes.where(alive: true).first
      my_fish.score_health -= (@my_challenge.challenge.score_health) / 2
      my_fish.score_health = 0 if my_fish.score_health.negative?
      current_user.save!
      my_fish.save!
      @my_challenge.save!
      redirect_to my_challenges_path
    else
      @my_challenge.status = "Completed"
      current_user.save!
      current_user.my_fishes.first.save!
      @my_challenge.save!
      redirect_to completed_challenge_path(@my_challenge.challenge)
    end
  end

  private

  def my_challenge_params
    params.permit(:challenge_id)
  end

  def calculate_end_time(my_challenge)
    if my_challenge.challenge.duration == "Weekly"
      return @my_challenge.start_time + 604800
    else
      return @my_challenge.start_time + 2.628e+6
    end
  end

  def calculate_progress(my_challenge)
    today = DateTime.now.utc
    progress_helper_total =  my_challenge.end_time - my_challenge.start_time
    progress_helper_unique = today - my_challenge.start_time
    @progress = (progress_helper_unique / progress_helper_total)*100
    @progress.round(2)
  end


end
