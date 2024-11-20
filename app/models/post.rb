class Post < ApplicationRecord
  belongs_to :owner, class_name: 'User'

  has_many :likes
  has_many :users, through: :likes
end
