class Fish < ApplicationRecord
  has_many :game_fishes
  validates :min_score, :max_age, numericality: { only_integer: true }
  validates :breed, :location, :endangered_status, :fish_avatar, :min_score, :max_age, presence: true
end
