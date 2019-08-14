class GameChallenge < ApplicationRecord
  belongs_to :game_fish
  belongs_to :challenge
  validates :game_fish_id, :challenge_id, :start_time, :end_time, presence: true
end
