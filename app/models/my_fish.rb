# class GameFish < ApplicationRecord
class MyFish < ApplicationRecord
  belongs_to :user
  belongs_to :fish
  has_many :game_challenges
  validates :score_happiness, numericality: true, inclusion: { in: [0, 1, 2, 3, 4, 5] }
  validates :score_health, numericality: true, inclusion: { in: (0..100) }
  validates :user_id, :fish_id, :name, :start_date, :score_health, :score_happiness, presence: true

  after_create :initial_age

  def initial_age
    new_age = (Date.today - self.created_at.to_date).to_i + 1
    self.age = new_age

    self.save
  end

  def update_fish_stats
  end

  def death_probability
  end

  def dead_or_alive
  self.alive = false if self.age > self.fish.max_age
  self.alive = false if self.score_health =< 0
  end
end
