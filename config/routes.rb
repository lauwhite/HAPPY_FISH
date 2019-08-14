Rails.application.routes.draw do
  devise_for :users
  get 'profile', to: 'users#show'
  resources :challenges, only: [:index, :show] do
    resources :questions, only: [:show]
  end
  resources :my_challenges, only: [:index, :show, :create]

  resources :fishes, only: [:index, :show] do
    resources :my_fishes, only: [:create]
  end

  resources :my_fishes, except: [:destroy, :create, :new]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :challenges, except: [:index, :show]
    resources :fishes, except: [:index, :show]
  end
end

