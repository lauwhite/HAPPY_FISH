class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :my_fishes
  has_many :game_challenges, through: :my_fishes
  validates :first_name, :last_name, :country, presence: true
  devise :omniauthable, omniauth_providers: %i[facebook]
  after_create :default_score, :default_level

  def default_score
    self.score = 0
    save
  end

  def default_level
    self.level = 1
    save
  end
end
