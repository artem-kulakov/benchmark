class ChangeColumnInUsers < ActiveRecord::Migration
  def change
    change_column :users, :rating,  :integer
  end
end
