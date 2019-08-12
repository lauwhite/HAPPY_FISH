class GameFish < ApplicationRecord
  belongs_to :user
  belongs_to :fish
  has_many :game_challenges
end
