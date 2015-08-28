class CreateFormulas < ActiveRecord::Migration
  def change
    create_table :formulas do |t|
      t.belongs_to :indicator, index: true
      t.string :notation

      t.timestamps
    end
  end
end
