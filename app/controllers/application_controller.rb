class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    fish = resource.my_fishes.find_by(alive: true)
    if fish
      my_fish_path(fish)
    else
     fishes_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :country, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :country, :avatar])
  end
end



