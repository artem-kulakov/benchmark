class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :title
      t.belongs_to :industry, index: true

      t.timestamps
    end
  end
end
