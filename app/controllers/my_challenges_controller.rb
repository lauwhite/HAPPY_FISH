class MyChallengesController < ApplicationController
  def index
    @my_challenges = GameChallenge.all
  end

  def show
    @my_challenge = GameChallenge.find(params[:id])
    @progress = calculate_progress(@my_challenge)
  end

  def create
    @my_challenge = GameChallenge.new(my_challenge_params)
    @my_challenge.my_fish = current_user.my_fishes.where(alive: true).first
    @my_challenge.start_time = DateTime.now
    @my_challenge.end_time = calculate_end_time(@my_challenge)
    if @my_challenge.save
      redirect_to my_challenges_path
    else
      redirect_to challenge_path(@my_challenge.challenge_id)
    end
  end

  private

  def my_challenge_params
    params.permit(:challenge_id)
  end

  def calculate_end_time(my_challenge)
    if my_challenge.challenge.duration == "Daily"
      return @my_challenge.start_time + 86400
    elsif my_challenge.challenge.duration == "Weekly"
      return @my_challenge.start_time + 604800
    else
      return @my_challenge.start_time + 2,628e+6
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
