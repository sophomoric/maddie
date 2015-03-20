class AddUrlKeyToPages < ActiveRecord::Migration
  def change
    add_column :pages, :url_key, :string, unique: true
    add_index :pages, :url_key, unique: true
  end
end
