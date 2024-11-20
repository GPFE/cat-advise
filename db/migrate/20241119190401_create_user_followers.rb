class CreateUserFollowers < ActiveRecord::Migration[7.2]
  def change
    create_table :user_followers do |t|
      t.bigint :follower_id
      t.bigint :influencer_id

      t.timestamps
    end
  end
end
