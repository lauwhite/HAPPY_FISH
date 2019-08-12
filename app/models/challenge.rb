class Challenge < ApplicationRecord
  belongs_to :challenge_category
  belongs_to :challenge_type
  has_many :questions
  has_many :game_challenges
end
