class AddForeignFollowRequestIdToUser < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :foreign_follow_request_id, :bigint
  end
end
