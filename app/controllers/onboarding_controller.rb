class OnboardingController < ApplicationController
  def lifestyle
    @my_fish = current_user.my_fishes.find_by(alive: true)
  end
end
