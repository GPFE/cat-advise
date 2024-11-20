class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_followers
  has_many :followers, through: :user_followers, as: :influencer

  has_many :influence_followers, class_name: 'UserFollower'
  has_many :influencers, through: :influence_followers, as: :follower, foreign_key: :influencer_id

  has_many :posts, as: :owner
  has_many :liked_posts, as: :follower
end
