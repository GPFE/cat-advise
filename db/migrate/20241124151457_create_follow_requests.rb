class CreateFollowRequests < ActiveRecord::Migration[7.2]
  def change
    create_table :follow_requests do |t|
      t.bigint :requester_id
      t.bigint :receiver_id

      t.timestamps
    end
  end
end
