class FishesController < ApplicationController
  def index
    @fishes = Fish.all
  end

  def show
    @fishes = Fish.find(params[:id])
  end
end
