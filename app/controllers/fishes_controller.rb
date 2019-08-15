class FishesController < ApplicationController
  def index
    @fishes = Fish.all
  end

  def show
    @fish = Fish.find(params[:id])
    @my_fish = MyFish.new
    # create a function: one day = one year of fish
  end
end
