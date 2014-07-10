class MediaProjects < ActiveRecord::Migration
  def change
    create_table :media_projects do |t|
      t.integer :project_id
      t.integer :medium_id
    end
  end
end
