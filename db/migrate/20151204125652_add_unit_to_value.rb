class AddUnitToValue < ActiveRecord::Migration
  def change
    add_column :values, :unit, :string
  end
end
