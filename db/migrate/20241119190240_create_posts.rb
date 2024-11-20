class CreatePosts < ActiveRecord::Migration[7.2]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :content
      t.bigint :owner_id
      t.bigint :follower_id

      t.timestamps
    end
  end
end
