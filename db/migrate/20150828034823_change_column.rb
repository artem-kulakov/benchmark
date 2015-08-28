class ChangeColumn < ActiveRecord::Migration
  def change
    change_column :values, :value,  :float
  end
end
