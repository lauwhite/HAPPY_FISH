class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  before_action :define_my_fish

  def after_sign_in_path_for(resource)
    fish = resource.my_fishes.find_by(alive: true)
    if fish
      my_fish_path(fish)
    else
      welcome_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :country, :avatar, :avatar_cache])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :country, :avatar, :avatar_cache])
  end

  def define_my_fish
    @my_fish = MyFish.find_by(alive: true, user: current_user)
  end
end

