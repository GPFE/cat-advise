class AddIsLikedToLike < ActiveRecord::Migration[7.2]
  def change
    add_column :likes, :is_liked, :boolean
  end
end
