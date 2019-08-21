class ProfileController < ApplicationController
  def show
    @user = current_user
    @my_completed_challenges = current_user.game_challenges.where(status: "Completed")
    @level = Level.find(@user.level_id)
  end
end
