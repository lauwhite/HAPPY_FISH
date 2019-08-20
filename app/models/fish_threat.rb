class FishThreat < ApplicationRecord
  belongs_to :fish
  belongs_to :threat
end
