class GameFish < ApplicationRecord
  belongs_to :user
  belongs_to :fish
  has_many :game_challenges
  validates :score_happiness, numericality: true, inclusion: { in: [0, 1, 2, 3, 4, 5] }
  validates :user_id, :fish_id, :name, :start_date, :score_health, :score_happiness, :alive, presence: true
end
