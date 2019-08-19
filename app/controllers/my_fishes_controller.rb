class MyFishesController < ApplicationController
  def index
    @my_fishes = MyFish.all
  end

  def show
    @my_fish = MyFish.find(current_user.my_fishes.find_by(alive: true).id)
    @my_fish.update_fish_stats
    @death_probability = @my_fish.death_probability
  end

  def create
    @my_fish = MyFish.new(my_fish_params)
    @my_fish.score_happiness = 0
    @my_fish.user = current_user
    @my_fish.fish = Fish.find(params[:fish_id])
    @my_fish.start_date = DateTime.now
    @my_fish.score_health = 100
    @my_fish.alive = true
    if @my_fish.save
      redirect_to @my_fish
    else
      render 'fishes/show'
    end
  end

  def edit
    @my_fish = MyFish.find(params[:id])
  end

  def update
    @my_fish = MyFish.find(params[:id])
    if @my_fish.update(my_fish_params)
      redirect_to @my_fish
    else
      render :edit
    end
  end

  private

  def my_fish_params
    params.require(:my_fish).permit(:name)
  end

end
