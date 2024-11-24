class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_followers
  has_many :followers, through: :user_followers, as: :influencer

  has_many :influence_followers, class_name: 'UserFollower'
  has_many :influencers, through: :influence_followers, as: :follower, foreign_key: :influencer_id

  has_many :likes
  has_many :liked_posts, through: :likes

  has_many :posts, foreign_key: :owner_id
  has_many :comments, foreign_key: :owner_id

  validates :email, uniqueness: true
  validates :username, uniqueness: true

  has_many :follow_requests, foreign_key: :requester
  has_many :foreign_follow_requests, foreign_key: :receiver
end
