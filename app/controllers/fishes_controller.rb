class FishesController < ApplicationController
  def index
    @fishes = Fish.all
    @user_score = current_user.score
    @available_fishes = Fish.where("min_score <= ?", @user_score)
    @blocked_fishes = Fish.where("min_score > ?", @user_score)
    @my_fish = MyFish.find_by(alive: true)
  end

  def show
    @fish = Fish.find(params[:id])
    @my_fish = MyFish.new
  end

  # def count_adopted_fishes
  #   if MyFish.where(alive: true).count == 1
  #     render js: "document.querySelector('.modal').classList.toggle('show-modal')"
  #   end
  # end
end
