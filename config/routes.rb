Rails.application.routes.draw do

  get 'onboarding_question/show'
  devise_for :users, controllers: {registrations: 'users/registrations',  omniauth_callbacks: 'users/omniauth_callbacks'}
  get 'profile', to: 'profile#show'
  get 'impact', to: 'impact#index'
  root to: 'my_fishes#show'

  # CHALLENGES

  resources :challenges, only: [:index, :show] do
    resources :my_challenges, only: [:create]
    resources :questions, only: [:show]
    member do
      get 'completed'
      get 'ongoing'
    end
  end

  get 'my_challenges/ongoing', to: 'my_challenges#ongoing', as: :ongoing_challenges
  get 'my_challenges/completed', to: 'my_challenges#completed', as: :completed_challenges

  #ONBOARDING
  # route for onboarding slider DO NOT DELETE !
  get 'welcome', to:'pages#welcome', as: :welcome
  # route for onboarding questions DO NOT DELETE !
  get 'lifestyle', to: 'onboarding#lifestyle'
  # resources :onboarding, only: [:show] do
  resources :onboarding_questions, only: [:show]
  # route
  get 'click', to: 'onboarding_questions#click'

  resources :my_challenges, only: [:index, :show, :update]


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
