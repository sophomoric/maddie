class RemoveMediaTableAndRelatedColumns < ActiveRecord::Migration
  def change
    drop_table :media
    drop_table :media_projects
  end
end
