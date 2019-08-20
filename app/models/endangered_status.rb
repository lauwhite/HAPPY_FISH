class EndangeredStatus < ApplicationRecord
  has_many :fish
  has_many :criteria_by_year
end
