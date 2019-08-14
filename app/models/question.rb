class Question < ApplicationRecord
  belongs_to :challenge
  has_many :answers
  validates :content, :challenge_id, presence: true
end
