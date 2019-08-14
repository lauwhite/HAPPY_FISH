class ChallengeType < ApplicationRecord
  has_many :challenges
  validates :name, presence: true
end
