class MyFishController < ApplicationController
  def show
    @fishes = Fish.find(params[:id])
  end

  def create
  end

  def edit
  end

  def update
  end
end
