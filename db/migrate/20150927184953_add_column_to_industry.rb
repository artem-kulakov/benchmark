class AddColumnToIndustry < ActiveRecord::Migration
  def change
    add_column :industries, :title, :string
  end
end
