class AddColumnToVersion < ActiveRecord::Migration
  def change
    add_column :versions, :maker_reward, :integer
  end
end
