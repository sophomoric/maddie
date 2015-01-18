class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.timestamps
      t.string :title, null: false, default: ""
      t.text :body, null: false, default: ""
      t.integer :order, null: false, unique: true
    end
  end
end
