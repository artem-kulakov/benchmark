class CreateIndustryIndicators < ActiveRecord::Migration
  def change
    create_table :industry_indicators do |t|
      t.belongs_to :industry, index: true
      t.belongs_to :indicator, index: true

      t.timestamps
    end
  end
end
