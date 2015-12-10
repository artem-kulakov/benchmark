class RenameVersionInValue < ActiveRecord::Migration
  def change
    rename_column :values, :version_id, :report_id
  end
end
