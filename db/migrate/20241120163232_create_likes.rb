class CreateLikes < ActiveRecord::Migration[7.2]
  def change
    create_table :likes do |t|
      t.bigint :post_id
      t.bigint :user_id

      t.timestamps
    end
  end
end
