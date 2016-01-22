class DropUnitsAndVersions < ActiveRecord::Migration
  def change
    drop_table :units
    drop_table :versions
  end
end
