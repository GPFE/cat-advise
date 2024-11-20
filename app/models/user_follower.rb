class UserFollower < ApplicationRecord
  belongs_to :influencer, class_name: 'User'
  belongs_to :follower, class_name: 'User'
end
