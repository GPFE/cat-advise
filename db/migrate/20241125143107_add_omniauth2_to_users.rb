class AddOmniauth2ToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :full_name, :string
    add_column :users, :avatar_url, :string
  end
end
