class AddColumnsToReport < ActiveRecord::Migration
  def change
    add_column :reports, :rating, :integer
    add_column :reports, :maker_id, :integer
    add_column :reports, :maker_reward, :integer
    add_column :reports, :checker_id, :integer
  end
end
