class Users::RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    root_path
     #'/an/example/path' # Or :prefix_to_your_route  # where do you want to go
  end
end
