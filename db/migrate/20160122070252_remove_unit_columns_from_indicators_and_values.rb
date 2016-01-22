class RemoveUnitColumnsFromIndicatorsAndValues < ActiveRecord::Migration
  def change
    remove_column :indicators, :unit_id
    remove_column :values, :unit
  end
end
