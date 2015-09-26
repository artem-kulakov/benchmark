class RemoveUserFromValue < ActiveRecord::Migration
  def change
    remove_column :values, :user_id, :integer
  end
end
