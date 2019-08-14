Rails.application.routes.draw do
  devise_for :users
  get 'profile', to: 'users#show'
  resources :challenges, only: [:index, :show] do
    resources :questions, only: [:show]
  end
  resources :my_challenges, only: [:index, :show, :create]
  resources :my_fish, except: [:index, :new, :destroy]
  resources :fishes, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :challenges, except: [:index, :show]
    resources :fishes, except: [:index, :show]
  end
end

end
