class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :my_fishes
  has_many :game_challenges, through: :my_fishes
  validates :first_name, :last_name, presence: true
  devise :omniauthable, omniauth_providers: [:facebook]
  after_create :default_score, :default_level
  mount_uploader :avatar, PhotoUploader

  def default_score
    self.score = 0
    save
  end

  def default_level
    self.level_id = Level.find_by(min_score: 0).id
    save
  end

  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice("provider", "uid")
    user_params.merge! auth.info.slice("email", "first_name", "last_name")
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end
  def never_started_challenges
    fishes_id = self.my_fishes.pluck(:id)
    played_games  = GameChallenge.where(my_fish_id: fishes_id).pluck(:challenge_id)
    Challenge.where.not(id: played_games)
  end

  def started_challenges_abandoned
    fishes_id = self.my_fishes.pluck(:id)
    played_games = GameChallenge.where(my_fish_id: fishes_id)
    played_games = played_games.where(status: "Abandoned").pluck(:challenge_id)
    Challenge.where(id: played_games)
  end

  def started_challenges_repeatable
    fishes_id = self.my_fishes.pluck(:id)
    played_games = GameChallenge.where(my_fish_id: fishes_id)
    played_games = played_games.where(status: "Completed").pluck(:challenge_id)
    Challenge.where(id: played_games)
  end
end
