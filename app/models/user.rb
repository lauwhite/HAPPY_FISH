class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :my_fishes
  has_many :game_challenges, through: :my_fishes
  validates :score, numericality: { only_integer: true }
  validates :first_name, :last_name, :country, :avatar, :level_id, :admin, :score, presence: true
end
