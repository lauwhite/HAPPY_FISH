class FishesController < ApplicationController
  def index
    @fishes = Fishes.all
  end

  def show
  end
end
