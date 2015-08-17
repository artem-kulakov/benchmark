class RenameColumn < ActiveRecord::Migration
  def change
    rename_column :indicators, :order, :sequence
  end
end
