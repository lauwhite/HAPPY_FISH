class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :game_fishes
  has_many :game_challenges, through: :game_fishes
  validates :first_name, :last_name, :country, presence: true
  validates :score, numericality: { only_integer: true }
end


