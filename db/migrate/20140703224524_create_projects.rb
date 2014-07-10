class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :description
      t.integer :height
      t.integer :width
      t.integer :year
      t.integer :price

      t.timestamps
    end
    
    add_index :projects, :year
  end
end
