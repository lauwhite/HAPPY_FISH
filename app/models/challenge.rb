class Challenge < ApplicationRecord
  belongs_to :challenge_category
  belongs_to :challenge_type
  has_many :questions
  has_many :game_challenges
  validates :min_score, :score_health, numericality: { only_integer: true }
  validates :score_happiness, numericality: true, inclusion: { in: [0, 1, 2, 3, 4, 5] }
  validates :name, :min_score, :duration, :challenge_category_id, :description, :score_health, :score_happiness, precense: true
end
