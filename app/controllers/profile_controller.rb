class ProfileController < ApplicationController
  def show
    @user = current_user
    @my_completed_challenges = current_user.game_challenges.where(status: "Completed")
    @level = Level.find(@user.level_id)
    level_under = Level.all.select { |level| level.min_score <= current_user.score}
    level_over = Level.all.select { |level| level.min_score > current_user.score}
    @levels = []
    level_under.each do |level|
      @levels << [level.name, level.min_score]
    end
    @levels << ["Current Score", current_user.score]
    level_over.each do |level|
      @levels << [level.name, level.min_score]
    end
  end
end
