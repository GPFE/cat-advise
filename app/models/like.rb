class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :post_id, uniqueness: { scope: :user_id, message: "has already been liked"}
end
