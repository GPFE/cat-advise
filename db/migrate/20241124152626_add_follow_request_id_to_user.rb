class AddFollowRequestIdToUser < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :follow_request_id, :bigint
  end
end
