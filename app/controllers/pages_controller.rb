class PagesController < ApplicationController
  def home
  end
  def welcome
  end
end

# profile only: show
# get '/profile', to: 'users#show'
# challenges only: index, show;
# user_challenges: only: index, show, create;
# challenges/id/questions/id: only: show;
# fish only: index,show;profile
# profile/game_fish: except: delete

# user -> profile -> my-challenges
# challenges -> /id ->
