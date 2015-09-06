class AddParentIdToIndustry < ActiveRecord::Migration
  def change
    add_column :industries, :parent_id, :integer
  end
end
