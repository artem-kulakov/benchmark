class AddColumnToVersions < ActiveRecord::Migration
  def change
    add_column :versions, :rating, :integer
  end
end
