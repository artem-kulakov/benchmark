class CreateIndustryTitles < ActiveRecord::Migration
  def change
    create_table :industry_titles do |t|
      t.string :title
      t.belongs_to :industry, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
