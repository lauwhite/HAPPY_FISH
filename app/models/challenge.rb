class Challenge < ApplicationRecord
  belongs_to :challenge_category
  belongs_to :challenge_type
  has_many :questions
  has_many :game_challenges
  validates :min_score, :score_health, numericality: { only_integer: true }
  validates :score_happiness, numericality: true, inclusion: { in: [0.0, 1.0, 2.0, 3.0, 4.0, 5.0] }
  validates :repeatable, inclusion: { in: [true, false] }
  validates :name, :min_score, :duration, :challenge_category_id, :description, :score_health, :score_happiness, presence: true
end
