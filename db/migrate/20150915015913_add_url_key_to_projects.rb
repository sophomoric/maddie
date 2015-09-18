class AddUrlKeyToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :url_key, :string
  end
end
