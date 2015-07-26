class CreateValues < ActiveRecord::Migration
  def change
    create_table :values do |t|
      t.belongs_to :indicator, index: true
      t.belongs_to :report, index: true
      t.integer :value

      t.timestamps
    end
  end
end
