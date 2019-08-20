class Fish < ApplicationRecord
  has_many :my_fishes
  has_many :threats, through: :fish_threats
  has_many :criteria_by_country
  has_many :criteria_by_year
  validates :min_score, :max_age, numericality: { only_integer: true }
  validates :breed, :location, :endangered_status, :fish_avatar, :min_score, :max_age, :red_list_id, presence: true
end
