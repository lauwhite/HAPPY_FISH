class MyChallengesController < ApplicationController
  def index
  end

  def show
  end

  def create
    @my_challenge = GameChallenge.new(my_challenge_params)
    @my_challenge.game_fish_id = current_user.game_fishes.where(alive: true)
    @my_challenge.start_time = DateTime.now
    @my_challenge.end_time = calculate_end_time(@my_challenge)
    if @my_challenge.save
     redirect_to my_challenges_path
   else
     redirect_to challenges_path
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

end
