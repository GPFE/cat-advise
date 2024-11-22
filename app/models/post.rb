class Post < ApplicationRecord
  belongs_to :owner, class_name: 'User'

  has_many :likes
  has_many :users, through: :likes

  has_many :comments

  validates :name, :content, presence: true
  validates :name, length: { minimum: 3, maximum: 30 }
  validates :content, length: { minimum: 3, maximum: 800 }
end
