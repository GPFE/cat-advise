class Comment < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  belongs_to :post

  validates :owner_id, :post_id, :content, presence: true
end
