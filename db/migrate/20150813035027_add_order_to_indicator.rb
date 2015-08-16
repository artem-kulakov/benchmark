class AddOrderToIndicator < ActiveRecord::Migration
  def change
    add_column :indicators, :order, :integer
  end
end
