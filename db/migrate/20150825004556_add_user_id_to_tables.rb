class AddUserIdToTables < ActiveRecord::Migration
  def change
    add_column :projects, :user_id, :integer
    add_column :pages, :user_id, :integer
    add_column :media, :user_id, :integer

    add_index :projects, :user_id
    add_index :pages, :user_id
    add_index :media, :user_id
  end
end
