class CreateComments < ActiveRecord::Migration[7.2]
  def change
    create_table :comments do |t|
      t.bigint :owner_id
      t.bigint :post_id
      t.string :content

      t.timestamps
    end
  end
end
