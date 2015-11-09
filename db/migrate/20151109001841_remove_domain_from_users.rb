class RemoveDomainFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :domain, :string
    remove_column :users, :page_title, :string
  end
end
