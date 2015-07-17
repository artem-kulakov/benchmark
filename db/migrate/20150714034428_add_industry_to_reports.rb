class AddIndustryToReports < ActiveRecord::Migration
  def change
    add_column :reports, :industry, :string
  end
end
