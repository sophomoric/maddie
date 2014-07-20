class AddAvatarColumnsToMedia < ActiveRecord::Migration
  def self.up
    add_attachment :media, :avatar
  end

  def self.down
    remove_attachment :media, :avatar
  end
  
end
