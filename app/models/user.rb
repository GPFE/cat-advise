class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :user_followers, foreign_key: :follower_id
  has_many :followers, through: :user_followers, source: :follower

  has_many :influence_followers, class_name: 'UserFollower', foreign_key: :influencer_id
  has_many :influencers, through: :influence_followers, source: :influencer

  has_many :likes
  has_many :liked_posts, through: :likes

  has_many :posts, foreign_key: :owner_id
  has_many :comments, foreign_key: :owner_id

  validates :email, uniqueness: true
  validates :username, uniqueness: true

  has_many :follow_requests, foreign_key: :requester
  has_many :foreign_follow_requests, foreign_key: :receiver, class_name: 'FollowRequest'

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.username = "#{Faker::Artist.name} #{rand(99999)}"
      user.password = Devise.friendly_token[0, 20]
      user.full_name = auth.info.name
      user.avatar_url = auth.info.image
      # user.skip_confirmation!
    end
  end
end
