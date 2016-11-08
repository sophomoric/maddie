class AddPasswordProtectedToMetaPropertyList < ActiveRecord::Migration
  def change
    add_column(
      :meta_property_lists,
      :password_protected,
      :boolean,
      default: false
    )
  end
end
