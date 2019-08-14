class FishesController < ApplicationController
  def index
    @fishes = Fish.all
  end

  def show
    @fish = Fish.find(params[:id])
  end
end
