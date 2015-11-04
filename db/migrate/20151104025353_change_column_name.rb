class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :versions, :user_id, :maker
  end
end
