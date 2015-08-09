class AddIndustryToIndicator < ActiveRecord::Migration
  def change
    add_reference :indicators, :industry, index: true
  end
end
