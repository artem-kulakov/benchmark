class AddCheckerToVersions < ActiveRecord::Migration
  def change
    add_column :versions, :checker, :string
  end
end
