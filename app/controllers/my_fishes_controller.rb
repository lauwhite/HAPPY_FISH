class MyFishesController < ApplicationController

  def index
    @my_fishes = MyFish.where(user: current_user)
  end

  def show
    @my_fish = MyFish.find_by(alive: true, user: current_user)
    if @my_fish
      @my_fish.update_fish_stats
      @death_probability = @my_fish.death_probability
    end
  end

  def create
    @my_fish = MyFish.new(my_fish_params)
    @my_fish.score_happiness = 0
    @my_fish.user = current_user
    @my_fish.fish = Fish.find(params[:fish_id])
    @my_fish.start_date = DateTime.now
    if MyFish.where(user: current_user).count == 0
      @my_fish.score_health = fish_health(current_user.score)
    else
      @my_fish.score_health = (MyFish.where(user: current_user).last.score_happiness * 20).to_i
    end
    @my_fish.alive = true
    if @my_fish.save
      ongoing_challenges = GameChallenge.where(status: "Ongoing", user: current_user)
      ongoing_challenges.each do |challenge|
        challenge.my_fish = @my_fish
        challenge.save!
      end
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

  def fish_health(score)
    if score <= 150 && score >= 75
      return 50
    elsif score <= 225 && score > 150
      return 75
    elsif score <= 300 && score > 225
      return 100
    end
  end
end
