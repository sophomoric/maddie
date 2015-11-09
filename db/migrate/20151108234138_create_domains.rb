class CreateDomains < ActiveRecord::Migration
  def change
    create_table :domains do |t|
      t.string :host
      t.string :page_title
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
