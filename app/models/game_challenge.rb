class GameChallenge < ApplicationRecord
  belongs_to :game_fish
  belongs_to :challenge
end
