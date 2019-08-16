class FishesController < ApplicationController
  def index
    @fishes = Fish.all
    @user_score = current_user.score
    @available_fishes = Fish.where("min_score <= ?", @user_score)
    @blocked_fishes = Fish.where("min_score > ?", @user_score)
    # raise
  end

  def show
    @fish = Fish.find(params[:id])
    @my_fish = MyFish.new
    # create a function: one day = one year of fish
  end
end
