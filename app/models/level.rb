class Level < ApplicationRecord
  has_many :users
  validates :min_score, numericality: { only_integer: true }
  validates :name, :min_score, precense: true
end
