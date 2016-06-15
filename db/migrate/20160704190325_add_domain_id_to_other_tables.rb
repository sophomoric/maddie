class AddDomainIdToOtherTables < ActiveRecord::Migration
  def change
    add_column :pages, :domain_id, :integer
    add_column :projects, :domain_id, :integer
    add_column :photos, :domain_id, :integer
  end
end
