Rails.application.routes.draw do
  devise_for :users
  get 'profile', to: 'users#show'
  resources :challenges, only: [:index, :show] do
    resources :questions, only: [:show]
  end
  resources :user_challenges, only: [:index, :show, :create]
  resources :game_fishes, except: [:destroy]
  resources :fishes, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
