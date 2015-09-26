class ChangeColumnInValue < ActiveRecord::Migration
  def change
    rename_column :values, :report_id, :version_id
  end
end
