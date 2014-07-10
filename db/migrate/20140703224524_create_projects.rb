class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :description
      t.integer :year

      t.timestamps
    end
    
    add_index :projects, :year
  end
end
