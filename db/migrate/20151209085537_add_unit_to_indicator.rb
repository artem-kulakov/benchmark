class AddUnitToIndicator < ActiveRecord::Migration
  def change
    add_reference :indicators, :unit, index: true
  end
end
