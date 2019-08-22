# class GameFish < ApplicationRecord
class MyFish < ApplicationRecord
  belongs_to :user
  belongs_to :fish
  has_many :game_challenges, dependent: :destroy
  validates :score_happiness, numericality: true, inclusion: { in: [0, 0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5] }
  validates :score_health, numericality: true, inclusion: { in: (0..100) }
  validates :user_id, :fish_id, :name, :start_date, :score_health, :score_happiness, presence: true

  after_create :initial_age

  def initial_age
    new_age = (Date.today - self.created_at.to_date).to_i + 1
    self.age = new_age
    self.save
  end

  def update_fish_stats
    new_age_helper = (Date.today - self.start_date.to_date).to_i
    if new_age_helper > self.age
      (new_age_helper - self.age).times do
        self.age += 1
        self.score_health -= 5 unless self.score_health == 0
        self.score_happiness -= 0.5 unless self.score_happiness == 0.0
        dead_or_alive
        break unless self.alive?
      end
    end
    self.save!
  end

  def death_probability
    death_probability = 100
    death_probability = death_probability - self.score_health
    death_probability = death_probability - (self.score_happiness * 9)
    return death_probability
  end

  def dead_or_alive
  self.alive = false if self.age >= self.fish.max_age
  self.alive = false if self.score_health <= 0
  self.alive = false if rand(200) < death_probability
  end
end
