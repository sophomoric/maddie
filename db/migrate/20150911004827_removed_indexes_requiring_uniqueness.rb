class RemovedIndexesRequiringUniqueness < ActiveRecord::Migration
  def change
    remove_index :pages, :url_key
  end
end
