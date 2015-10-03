class AddTitleToUser < ActiveRecord::Migration
  def change
    add_column :users, :page_title, :string
  end
end
