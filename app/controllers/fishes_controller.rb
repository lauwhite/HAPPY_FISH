class FishesController < ApplicationController
  def index
    @fishes = Fish.all
  end

  def show
    @fish = Fish.find(params[:id])
    @gamefish = GameFish.new
    # create a function: one day = one year of fish
  end
end
