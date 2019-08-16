class GameChallenge < ApplicationRecord
  belongs_to :my_fish
  belongs_to :challenge
  validates :my_fish_id, :challenge_id, :start_time, :end_time, :status, presence: true
end
