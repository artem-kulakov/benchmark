class RenameParentId < ActiveRecord::Migration
  def change
    rename_column :industries, :parent_id, :initial_id
  end
end
