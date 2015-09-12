class RemoveTitleAndParentIdFromIndustry < ActiveRecord::Migration
  def change
    remove_column :industries, :title, :string
    #remove_column :industries, :parent_id, index: true
    #remove_column :industries, :parent_id_id, index: true
  end
end
