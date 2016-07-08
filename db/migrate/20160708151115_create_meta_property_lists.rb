class CreateMetaPropertyLists < ActiveRecord::Migration
  def change
    create_table :meta_property_lists do |t|
      t.belongs_to :domain
      t.string :og_image
      t.string :og_url
      t.string :og_title
      t.text :root_content

      t.timestamps null: false
    end
  end
end
