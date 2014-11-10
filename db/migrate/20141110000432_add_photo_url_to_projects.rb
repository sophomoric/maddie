class AddPhotoUrlToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :photo_url, :string
  end
end
