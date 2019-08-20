class RegionalCriterium < ApplicationRecord
  has_many :fish
  has_many :criteria_by_country
end
