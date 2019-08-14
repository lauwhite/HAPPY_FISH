class ChallengeType < ApplicationRecord
  has_many :challenges
  validates :name, precense: true
end
